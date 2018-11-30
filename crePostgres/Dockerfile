# Adapted from https://github.com/partlab/docker/blob/master/ubuntu-postgresql/Dockerfile
# and https://github.com/docker-library/postgres/blob/master/9.5/docker-entrypoint.sh
FROM tamboraorg/creubuntu:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV POSTGRES_VERSION 9.5
ENV RANDOM_DOCKER_DEFAULT {$(pwgen -c -n -1 14)}

LABEL Name="Postgres for CRE" \
#      org.label-schema.build-date=$BUILD_DATE \
#      Date=$(date +%F) \
#      Year=$(date +%Y) \
#      Month=$(date +%m) \
#      Test=$(date +0.%Y.%m) \
#      Final=$(date +%Y.%m) \
      Version=$POSTGRES_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build=$CRE_VERSION 

# Labels.
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="tamboraorg/crepostgres"
LABEL org.label-schema.description="Postgres for CRE"
#LABEL org.label-schema.url="http://ballerinalang.org/"
#LABEL org.label-schema.vcs-url="https://github.com/tamboraorg/docker"
LABEL org.label-schema.vcs-ref=$VCS_REF
#LABEL org.label-schema.vendor="?"
LABEL org.label-schema.version=$BUILD_VERSION
#LABEL org.label-schema.docker.cmd="docker run tamboraorg/postgres"

RUN export RANDOM_DOCKER_RUN=$(pwgen -c -n -1 14)

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

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePostgres \t $(/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres --version)" >> /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  psql \t $(psql --version)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/

VOLUME ["/var/lib/postgresql"]

EXPOSE 5432

#USER postgres

ENTRYPOINT ["/cre/postgres-entrypoint.sh"]

CMD ["/cre/run.sh"]