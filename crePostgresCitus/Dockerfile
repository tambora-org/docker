# Adapted from https://github.com/partlab/docker/blob/master/ubuntu-postgresql/Dockerfile
# and https://github.com/docker-library/postgres/blob/master/9.5/docker-entrypoint.sh
FROM tamboraorg/crepostgres:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV CITUS_VERSION 6.0

LABEL Name="Postgres Citus for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$CITUS_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
#    echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' \
#      | tee /etc/apt/sources.list.d/postgresql.list 

USER root

RUN curl https://install.citusdata.com/community/deb.sh | bash
RUN apt update
RUN apt-get -y install postgresql-${POSTGRES_VERSION}-citus
RUN pg_conftool ${POSTGRES_VERSION} main set shared_preload_libraries citus


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePostgres \t $(/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres --version)" >> /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  psql \t $(psql --version)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/

VOLUME ["/var/lib/postgresql"]

EXPOSE 5432

USER postgres

ENTRYPOINT ["/cre/postgres-entrypoint.sh"]

CMD ["shoreman", "/cre/postgres-procfile"]
