#
# ElasticSearch Dockerfile
#
# https://github.com/tamboraorg/docker/creelastic
# https://tecadmin.net/setup-elasticsearch-on-ubuntu/
# https://www.elastic.co/guide/en/elasticsearch/reference/7.4/deb.html#deb-repo
# https://www.elastic.co/downloads/elasticsearch
# 
FROM tamboraorg/crejava:2012.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

#ENV DEBIAN_FRONTEND noninteractive
#ENV INITRD No
#ENV LANG en_US.UTF-8
ENV PATH=$PATH:/usr/share/elasticsearch/bin
ENV ELASTIC_VERSION 7.4.1

#RUN echo "deb https://artifacts.elastic.co/packages/$ELASTIC_VERSION/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
#RUN apt-get update && sudo apt-get install elasticsearch && apt-get clean


RUN wget "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTIC_VERSION-amd64.deb" && \
    wget "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTIC_VERSION-amd64.deb.sha512" && \
    shasum -a 512 -c elasticsearch-7.4.1-amd64.deb.sha512 && \
    dpkg -i elasticsearch-$ELASTIC_VERSION-amd64.deb

#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.1-amd64.deb
#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.1-amd64.deb.sha512
#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.1-amd64.deb.asc

#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.4.1-amd64.deb

#RUN wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
#   echo 'deb http://packages.elasticsearch.org/elasticsearch/7.x/debian stable main' \
#     | tee /etc/apt/sources.list.d/elasticsearch.list && \
#   apt-get update && \
#   apt-get install --no-install-recommends -y elasticsearch && \
#   /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head && \
#   apt-get clean && \
#   rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/elasticsearch

RUN set -ex \
  && for path in \
  ./data \
    ./logs \
    ./config \
    ./config/scripts \
  ; do \
    mkdir -p "$path"; \
    chown -R elasticsearch:elasticsearch "$path"; \
  done

COPY ./config /usr/share/elasticsearch/config
COPY cre /cre
#WORKDIR /cre/

USER elasticsearch

VOLUME ["/usr/share/elasticsearch"]
