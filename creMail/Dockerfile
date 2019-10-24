#
# Mail Dockerfile
#
# https://github.com/tamboraorg/docker/cremail

# Pull base image.
FROM tamboraorg/creubuntu:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
ENV MAIL_VERSION 0.0    

LABEL Name="Mail for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MAIL_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix mailutils ; \
    apt-get clean

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creMail \t $MAIL_VERSION " >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  postfix \t $(postconf mail_version)" >> /cre/versions.txt 

# File permissions workaround
# RUN usermod -u 1000 www-data

COPY cre/ /cre/

# Open up mail port 
EXPOSE 25/tcp

VOLUME ["/cre/mail"]

WORKDIR "/cre/mail"

# Define default command.
ENTRYPOINT ["/cre/mail-entrypoint.sh"]
CMD ["shoreman", "/cre/mail-procfile"]
