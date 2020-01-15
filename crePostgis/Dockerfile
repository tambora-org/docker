# Adapted from mdillon/postgis:9.5
# and https://github.com/docker-library/postgres/blob/master/9.5/docker-entrypoint.sh
FROM tamboraorg/crepostgres:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

#ENV POSTGIS_MAJOR 2.5
#ENV POSTGIS_MAJOR 2.3
ENV POSTGIS_MAJOR 2.4
#ENV POSTGIS_VERSION 2.3.2+dfsg-1~exp2.pgdg80+1
#ENV POSTGIS_VERSION 2.3.2+dfsg-1~exp2.pgdg16.04+1
#ENV POSTGIS_VERSION 2.5.1
#ENV POSTGIS_VERSION 2.3.2 
ENV POSTGIS_VERSION 2.4.2 

USER root

#RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
RUN add-apt-repository ppa:ubuntugis/ppa

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
           postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_MAJOR 
#RUN apt-get install -y --no-install-recommends \
#           postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_MAJOR-scripts 
RUN apt-get install -y --no-install-recommends \
           postgresql-$POSTGRES_VERSION-postgis-scripts 

RUN apt-get install -y --no-install-recommends \
           postgis 
RUN rm -rf /var/lib/apt/lists/*

COPY cre /cre
WORKDIR /cre/
RUN chown -R postgres.postgres /cre 

USER postgres

#RUN mkdir -p /docker-entrypoint-initdb.d
#COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
#COPY ./update-postgis.sh /usr/local/bin
