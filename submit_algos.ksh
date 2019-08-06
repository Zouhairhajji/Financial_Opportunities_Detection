#/bin/bash


spark_submitter=${SPARK_HOME}/bin/spark-submit
old_folder=$PWD
new_folder=$(dirname $0)


if [[ $1 -eq 2 ]]
then
    echo "run algo 2"
    sleep 2

    input_file='ressources/data/financial_sells_100000.csv'
    csv_separator=','
    py_filename='2_Cross_Selling_Analysis/Cross_Selling_Analysis_Spark.py'
    master_ip='127.0.0.1'

    ${spark_submitter} ${py_filename} ${master_ip} ${input_file} ${csv_separator}
fi





