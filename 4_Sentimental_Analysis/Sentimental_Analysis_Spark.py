from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession

from pyspark.sql.types import StringType, IntegerType, ArrayType, FloatType, TimestampType, DateType
from pyspark.sql.functions import udf
from pyspark.sql import functions as F, Row

import sys

# web api
from bs4 import BeautifulSoup as soup
from urllib.request import urlopen
import urllib.parse as urlparse
from urllib.parse import urlencode

#sentimental vader
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer 

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


# retreive all news from google news api
def get_company_news(company_name):
    url = 'https://news.google.com/news/rss/headlines/section/topic/BUSINESS?'
    company_name = company_name # nom de l'entreprise
    parameters = {
        'q': company_name, # query phrase
        'pageSize': 2, 
        'en': 'en' ,
    }
    
    url = url + urlencode(parameters)

    rss_reader = urlopen(url)
    rss_data = rss_reader.read()
    rss_reader.close()

    soup_page = soup(rss_data, "xml")
    news_list = soup_page.findAll("item")
    return news_list

# analyse company reputation and calculate flag reputation
def analyse_company_reputation(company_name, _analyzer):
    global_result = {
        'company_name': company_name,
        'negative': 0,
        'positive': 0,
        'neutre': 0,
        'flag_gravity' : 0,
        'flag': 'No Flag',
        'neg_tweets' : []
    }
    
    for news in get_company_news(company_name):
        analyse_result = _analyzer.polarity_scores(news.title.text)
        global_result['negative'] += analyse_result['neg']
        global_result['positive'] += analyse_result['pos']
        global_result['neutre'] += analyse_result['neu']

        if(analyse_result['neg'] > 0.2):
            global_result['neg_tweets'].append( news.title.text )
    
    flags = ['green', 'orange', 'red', 'red', 'red']
    global_result['flag_gravity'] = int( global_result['negative'] / global_result['positive'] )
    global_result['flag'] = flags[global_result['flag_gravity']]
    
    return global_result



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

    

    company_names = init_flat_data \
        .select('company_name') \
        .distinct()

    # initialize sentimental analyze
    sentimental_analyser = SentimentIntensityAnalyzer()

    #udh method that convert array to string with  | as separator
    def_array2str = udf(lambda x: '|'.join(x), StringType())

    # detect reputation of each company
    result_reputation = company_names \
        .rdd \
        .map(lambda x: Row(**analyse_company_reputation(x.company_name, sentimental_analyser)) ) \
        .toDF() \
        .withColumn('neg_tweets', def_array2str('neg_tweets'))


    result_reputation.show(10)

    
    # save resultat in a csv file
    result_reputation.coalesce(1) \
        .write   \
        .format("csv") \
        .mode('overwrite') \
        .option("header", "true") \
        .save('./ressources/data/4_sentimental_analysis_output')