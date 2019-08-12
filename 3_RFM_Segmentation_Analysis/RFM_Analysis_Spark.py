from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession


from pyspark.sql.types import StringType, IntegerType, ArrayType, FloatType, TimestampType, DateType
from pyspark.sql.functions import udf, dense_rank, desc, asc
from pyspark.sql.functions import mean as _mean, min as _min, max as _max, sum as _sum, count as _count, datediff, to_date
from pyspark.sql.functions import to_utc_timestamp, unix_timestamp, lit, datediff, col, date_format

from pyspark.sql import functions as F
from pyspark.sql.functions import collect_set
from pyspark.sql.window import Window

import math
import numpy as np
import sys
import datetime as dt




# method that print only blanks
def print_blanks(n=10):
    for i in range(n):
        print('\n')

# method that create connection with spark server
def create_spark_context(master_ip='127.0.0.1'):
    master_ip = 'spark://{}:7077'.format(master_ip)
    spark = SparkSession.builder \
        .master(master_ip)  \
        .enableHiveSupport() \
        .getOrCreate()
    
    sc = spark.sparkContext
    return (spark, sc)

spark, sc = create_spark_context()




#main method
if __name__ == "__main__":
    # print empty lines
    print_blanks(5)

    #retreive data from parameters
    master_ip = sys.argv[1]
    input_filename = sys.argv[2]
    csv_separator = sys.argv[3]
    
    spark, sc = create_spark_context(master_ip)

    # read csv file
    init_flat_data = spark.read         \
        .option("sep", csv_separator)  \
        .csv(input_filename, header=True)

    # remove useless data
    init_flat_data = init_flat_data.fillna(0)

    #cast columns
    init_flat_data = init_flat_data \
        .withColumn('order_date', to_date(unix_timestamp("order_date", "yyyy-MM-dd").cast('timestamp')) ) \
        .withColumn('NBI', col('NBI').cast('float') ) \
        .withColumn('order_id', col('order_id').cast('int')) \
        .withColumn('company_id', col('company_id').cast('int'))

    # print schema
    print(init_flat_data.printSchema(), '\n')

    # calculate min and max or order date in order to calculate recency
    max_order_date, min_order_date = init_flat_data \
        .select( _max(col('order_date')), _min(col('order_date'))) \
        .take(1)[0]
    

    # calculate recency/frequency and monetary
    calculate_diff_day = udf(lambda x: (max_order_date - x).days, IntegerType())
    rfm_table = init_flat_data \
        .withColumn('recency', calculate_diff_day('order_date')) \
        .groupby(['company_id', 'company_name', 'country']) \
        .agg( 
            _mean(col('recency')).alias('recency'), 
            _count(col('order_id')).alias('frequency'),
            _sum(col('NBI')).alias('monetary')
        )

    # calculate quantiles for each variable
    quantiles = rfm_table.approxQuantile(['recency', 'frequency', 'monetary'], [0.20, 0.4, 0.6, 0.8], 0)
    r_quantile = quantiles[0]
    f_quantile = quantiles[1]
    m_quantile = quantiles[2]


    # calculate score of each variable
    def_r_score = udf(lambda x: 5 if x < r_quantile[0] else 4 if x < r_quantile[1] else 3 if x < r_quantile[2] else 2 if x < r_quantile[3] else 1, IntegerType())
    def_f_score = udf(lambda x: 1 if x < f_quantile[0] else 2 if x < f_quantile[1] else 3 if x < f_quantile[2] else 4 if x < f_quantile[3] else 5, IntegerType())
    def_m_score = udf(lambda x: 1 if x < m_quantile[0] else 2 if x < m_quantile[1] else 3 if x < m_quantile[2] else 4 if x < m_quantile[3] else 5, IntegerType())

    def_rfm_score = udf(lambda r, f, m: r*100 + f*10 + m , IntegerType())
    def_seg_id = udf(lambda r, f: r*10 + f, StringType())

    rfm_table = rfm_table  \
        .withColumn('r_score',  def_r_score('recency')) \
        .withColumn('f_score',  def_f_score('frequency')) \
        .withColumn('m_score',  def_m_score('monetary')) \
        .withColumn('rfm_score', def_rfm_score('r_score', 'f_score', 'm_score')) \
        .withColumn('segment_id', def_seg_id('r_score', 'f_score')  ) \
        .sort(asc('monetary')) 

    # labelize each company based on segment id
    segt_map = {
        r'[1-2][1-2]': 'hibernating',
        r'[1-2][3-4]': 'at risk',
        r'[1-2]5': 'can\'t loose',
        r'3[1-2]': 'about to sleep',
        r'33': 'need attention',
        r'[3-4][4-5]': 'loyal customers',
        r'41': 'promising',
        r'51': 'new customers',
        r'[4-5][2-3]': 'potential loyalists',
        r'5[4-5]': 'champions'
    }

    pd_df = rfm_table   \
        .select('company_name', 'country', 'segment_id')   \
        .toPandas()   \
        .replace(segt_map, regex=True)   \
        .rename(columns={'segment_id': 'segment_name'})
        

    rfm_table = rfm_table  \
        .join(spark.createDataFrame(pd_df), how='left', on=['company_name', 'country'])
    

    rfm_table.coalesce(1) \
        .write   \
        .format("csv") \
        .mode('overwrite') \
        .option("header", "true") \
        .save('./ressources/data/3_rfm_analysis_output')


    # save result in my postgresql database
    mode = "overwrite"
    table_name = 'algo_rfm_analysis'
    url = "jdbc:postgresql://127.0.0.1:5432/financial_opportunities"
    properties = {
        "user": "zouhairhajji",
        "password": '',
        "driver": "org.postgresql.Driver"
    }
    rfm_table  \
            .write     \
            .jdbc(url=url, table=table_name, mode=mode, properties=properties)

    rfm_table.show(10)