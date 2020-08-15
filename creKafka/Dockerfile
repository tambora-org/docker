#
# Kafka Dockerfile
#
# https://github.com/tamboraorg/docker/crekafka
#

# Pull base image. 
FROM tamboraorg/crejava:latest

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV KAFKA_VERSION 2.4.0

LABEL Name="Kafka for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$KAFKA_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# https://tecadmin.net/install-apache-kafka-ubuntu/
## https://kafka.apache.org/downloads
RUN wget http://www-us.apache.org/dist/kafka/2.4.0/kafka_2.13-2.4.0.tgz && \
     tar xzf kafka_2.13-2.4.0.tgz && \
     mv kafka_2.13-2.4.0 /usr/local/kafka


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  jdk \t $(javac -version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t creKafka \t $(/usr/local/kafka/bin/kafka-topics.sh --version)" >> /cre/versions.txt 



#ENV JENKINS_HOME /var/jenkins

COPY cre /cre
WORKDIR /cre/

#EXPOSE 8080 50000

# ENTRY-POINT /cre/start-kafka.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

CMD ["/usr/bin/java", "-version"]
