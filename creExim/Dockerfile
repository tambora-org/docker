#
# Exim Dockerfile
#
# https://github.com/tamboraorg/docker/creexim
# https://github.com/BytemarkHosting/docker-smtp/blob/master/stretch/Dockerfile

# Pull base image.
FROM tamboraorg/creubuntu:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
ENV EXIM_VERSION 0.0    

LABEL Name="Exim for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$EXIM_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN set -ex; \
    apt-get update; \
    apt-get install -y exim4-daemon-light  mailutils ; \
    apt-get clean

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t crePhp \t $EXIM_VERSION " >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  $(exim -v)" >> /cre/versions.txt 

# File permissions workaround
# RUN usermod -u 1000 www-data

COPY cre/ /cre/

# Open up mail port 
EXPOSE 25/tcp

VOLUME ["/cre/mail"]

WORKDIR "/cre/mail"

# Define default command.
#CMD /cre/php-fpm.sh
ENTRYPOINT ["/cre/exim-entrypoint.sh"]
CMD ["shoreman", "/cre/exim-procfile"]
