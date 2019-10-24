#
# ElasticSearch Dockerfile
#
# https://github.com/tamboraorg/docker/creelastic
# https://tecadmin.net/setup-elasticsearch-on-ubuntu/
# https://www.elastic.co/guide/en/elasticsearch/reference/7.4/deb.html#deb-repo
# 
FROM tamboraorg/crejava:2012.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

#ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV PATH=$PATH:/usr/share/elasticsearch/bin
ENV ELASTIC_VERSION 7

#RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
#RUN apt-get update && sudo apt-get install elasticsearch

RUN wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
   echo 'deb http://packages.elasticsearch.org/elasticsearch/7.x/debian stable main' \
     | tee /etc/apt/sources.list.d/elasticsearch.list && \
   apt-get update && \
   apt-get install --no-install-recommends -y elasticsearch && \
   /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

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
