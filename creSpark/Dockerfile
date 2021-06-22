#
# Spark Dockerfile
#
# https://github.com/tamboraorg/docker/crespark
#

# Pull base image. 
FROM tamboraorg/crejava:latest

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV SPARK_VERSION 3.0.0
ENV HADOOP_VERSION=2.7

LABEL Name="Spark for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$SPARK_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# https://computingforgeeks.com/how-to-install-apache-spark-on-ubuntu-debian/

# https://archive.apache.org/dist/spark/spark-3.0.0/
# https://archive.apache.org/dist/spark/spark-3.0.0/spark-3.0.0-bin-hadoop2.7.tgz

# see https://www.kdnuggets.com/2020/07/apache-spark-cluster-docker.html

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /usr/bin/ && \
    mkdir /usr/bin/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/logs && \
    rm spark.tgz

ENV SPARK_HOME /usr/bin/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV SPARK_MASTER_HOST cresparkmaster
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

ENV CRE_WORKSPACE /cre/workspace

ARG spark_master_web_ui=8080

EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT} ${spark_worker_web_ui}

#MASTER:
#CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out

#WORKER:
#ARG spark_worker_web_ui=8081
#EXPOSE ${spark_worker_web_ui}
#CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out

# -- Runtime

COPY cre /cre

WORKDIR ${SPARK_HOME}
#WORKDIR /cre/spring/app

VOLUME ${CRE_WORKSPACE}

#EXPOSE 7077 

# Define default command.
ENTRYPOINT ["/cre/spark-entrypoint.sh"]
CMD ["shoreman", "/cre/spark-procfile"]

 
