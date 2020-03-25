#
# Nginx Jitsi Dockerfile
#
# https://github.com/tamboraorg/docker/crejitsi
# https://github.com/jitsi/jitsi-meet/blob/master/doc/quick-install.md
# https://github.com/jitsi/docker-jitsi-meet

# Pull base image.
FROM tamboraorg/crenginx:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

LABEL Name="Jitsi for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$NGINX_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creJitsi \t " >> /cre/versions.txt

RUN echo 'deb https://download.jitsi.org stable/' >> /etc/apt/sources.list.d/jitsi-stable.list && \
    wget -qO -  https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -

RUN add-apt-repository universe && \
    apt-get install apt-transport-https && \
    apt update

RUN apt-get -y install jitsi-meet

#todo ? FQDN
#RUN /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh




#COPY /cre/nginx-php.conf /etc/nginx/conf.d/default.conf
#COPY cre/ /cre/

# Define mountable directories.
#VOLUME ["/cre/www"]

# Define working directory.
#WORKDIR /cre/www

# Define default command.
#ENTRYPOINT ["/cre/nginx-php-entrypoint.sh"]
#CMD ["shoreman", "/cre/nginx-php-procfile"]

# Expose ports.
#EXPOSE 80
