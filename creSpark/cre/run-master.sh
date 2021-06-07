#!/bin/sh 

echo "Deploy Spark Master"

bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
