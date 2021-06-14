#
# Postgres Dev
#
# https://github.com/tamboraorg/docker/crePostgresDev
# ( https://wiki.postgresql.org/wiki/Compile_and_Install_from_source_code )
# ( https://www.postgresql.org/docs/current/install-short.html )

# Pull base image.
FROM tamboraorg/creubuntu:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

ENV POSTGRES_VERSION 12.2

WORKDIR /cre/

RUN apt-get update -y && \
    apt-get install -y -q --no-install-recommends build-essential libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libxml2-utils xsltproc


#https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.gz

RUN curl https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.gz > /cre/postgresql.tar.gz && \
    tar -C /usr/local -xzf /cre/postgresql.tar.gz && \
    rm -f /cre/postgresql.tar.gz && \
    mv /cre/postgresql-12.2 /cre/postgresql-src

RUN cd /cre/postgresql-src && ./configure && make

# Set environment variables.
ENV HOME /cre/postgresql-src

# Define working directory.
WORKDIR /cre/postgresql-src

VOLUME ["/cre/postgresql-src/contrib/extension"]

ENTRYPOINT ["/cre/pg-dev-entrypoint.sh"]
CMD ["shoreman", "/cre/pg-dev-procfile"]

