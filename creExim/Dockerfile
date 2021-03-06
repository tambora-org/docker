#
# Exim Dockerfile
#
# https://github.com/tamboraorg/docker/creexim
# https://github.com/BytemarkHosting/docker-smtp/blob/master/stretch/Dockerfile

# Pull base image.
FROM tamboraorg/creubuntu:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
ENV EXIM_VERSION 0.0    

LABEL Name="Exim for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$EXIM_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

RUN set -ex; \
    apt-get update; \
    apt-get install -y exim4-daemon-light mailutils ; \
    apt-get clean

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creExim \t $EXIM_VERSION " >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  $(exim --version)" >> /cre/versions.txt 

# File permissions workaround
# RUN usermod -u 1000 www-data

COPY cre/ /cre/

# Open up mail port 
EXPOSE 25/tcp

VOLUME ["/cre/mail"]

WORKDIR "/cre/mail"

# Define default command.
ENTRYPOINT ["/cre/exim-entrypoint.sh"]
CMD ["shoreman", "/cre/exim-procfile"]
