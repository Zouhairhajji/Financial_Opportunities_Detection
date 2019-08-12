#/bin/bash


spark_submitter=~/Documents/dev/spark-2.4.0-bin-hadoop2.7/bin/spark-submit
old_folder=$PWD
new_folder=$(dirname $0)

BASE_URL=$(dirname $0)

if [[ $1 -eq 1 ]]
then
    echo "run algo 1"
    sleep 2

    input_file=$BASE_URL'/ressources/data/input_aerospace_proof_of_concept.csv'
    csv_separator=';'
    py_filename=$BASE_URL'/1_External_Data_Analysis/External_Data_Analysis_Spark.py'
    master_ip='127.0.0.1'

    ${spark_submitter} ${py_filename} ${master_ip} ${input_file} ${csv_separator}
fi



if [[ $1 -eq 2 ]]
then
    echo "run algo 2"
    sleep 2

    input_file=$BASE_URL'/ressources/data/financial_sells_1000000.csv'
    csv_separator=','
    py_filename=$BASE_URL'/2_Cross_Selling_Analysis/Cross_Selling_Analysis_Spark.py'
    master_ip='127.0.0.1'

    ${spark_submitter} ${py_filename} ${master_ip} ${input_file} ${csv_separator}
fi



if [[ $1 -eq 3 ]]
then
    echo "run algo 3"
    sleep 2

    input_file=$BASE_URL'/ressources/data/financial_sells_1000000.csv'
    csv_separator=','
    py_filename=$BASE_URL'/3_RFM_Segmentation_Analysis/RFM_Analysis_Spark.py'
    master_ip='127.0.0.1'

    ${spark_submitter} ${py_filename} ${master_ip} ${input_file} ${csv_separator}
fi








if [[ $1 -eq 4 ]]
then
    echo "run algo 4"
    sleep 2

    input_file=$BASE_URL'/ressources/data/financial_sells_1000000.csv'
    csv_separator=','
    py_filename=$BASE_URL'/4_Sentimental_Analysis/Sentimental_Analysis_Spark.py'
    master_ip='127.0.0.1'

    ${spark_submitter} ${py_filename} ${master_ip} ${input_file} ${csv_separator}
fi


