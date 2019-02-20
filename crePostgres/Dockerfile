# Adapted from https://github.com/partlab/docker/blob/master/ubuntu-postgresql/Dockerfile
# and https://github.com/docker-library/postgres/blob/master/9.5/docker-entrypoint.sh
FROM tamboraorg/creubuntu:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV POSTGRES_VERSION 9.5

LABEL Name="Postgres for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$DOCKER_GEN_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
#    echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' \
#      | tee /etc/apt/sources.list.d/postgresql.list 

RUN add-apt-repository ppa:ubuntugis/ppa

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
      postgresql-$POSTGRES_VERSION postgresql-client-$POSTGRES_VERSION postgresql-contrib-$POSTGRES_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf && \
    echo "listen_addresses='*'" >> /etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf  && \
    rm -rf /var/lib/postgresql/$POSTGRES_VERSION/main && \
    update-rc.d -f postgresql disable

#ADD run /usr/local/bin/run
#RUN chmod +x /usr/local/bin/run

RUN mkdir -p /var/run/postgresql/${POSTGRES_VERSION}-main.pg_stat_tmp
RUN chown postgres.postgres /var/run/postgresql/${POSTGRES_VERSION}-main.pg_stat_tmp -R

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
