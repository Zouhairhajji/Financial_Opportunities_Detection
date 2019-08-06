
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession


from pyspark.sql.types import StringType, IntegerType, ArrayType
from pyspark.sql.functions import udf
from pyspark.sql import functions as F
from pyspark.sql.functions import collect_set
import numpy as np
import sys

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

    # print our schema
    print( init_flat_data.printSchema() )


    # print empty lines
    print_blanks(2)

    rdd_product_by_group = init_flat_data  \
        .groupby(['sector_name', 'country'])   \
        .agg( collect_set('product_name').alias('all_product_group') )    




    grouped_customers = init_flat_data  \
            .groupby(['sector_name', 'country', 'company_name', 'company_id'])    \
            .agg(collect_set('product_name').alias('product_bought')) 


    # define two methods that calculate unbought products
    calculate_diff = udf(lambda x, y: len(set(x) - set(y)) , IntegerType())
    calculate_unbought_products = udf(lambda x, y: list(set(x) - set(y)) , ArrayType(StringType()))

    #convert array to string
    convert_array2str = udf(lambda x: ','.join(x) , StringType())

    detection_result = grouped_customers    \
        .join(rdd_product_by_group, on=['sector_name', 'country'])  \
        .withColumn('diff_count', calculate_diff('all_product_group', 'product_bought')) \
        .withColumn('unbought_products', calculate_unbought_products('all_product_group', 'product_bought')) \
        .filter('diff_count > 0')


    # remove array columns
    detection_result = detection_result \
        .withColumn('unbought_products', convert_array2str('unbought_products'))  \
        .withColumn('product_bought', convert_array2str('product_bought'))  \
        .withColumn('all_product_group', convert_array2str('all_product_group')) 


    detection_result.coalesce(1) \
        .write   \
        .format("csv") \
        .mode('overwrite') \
        .option("header", "true") \
        .save('../ressources/data/2_cross_selling_output')

    print( detection_result.show(10) )

    print_blanks(5)

