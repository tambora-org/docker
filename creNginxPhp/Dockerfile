#
# Nginx Php Dockerfile
#
# https://github.com/tamboraorg/docker/crenginxphp
#

# Pull base image.
FROM tamboraorg/crenginx:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

LABEL Name="Nginx-Php for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$NGINX_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creNginxPhp \t " >> /cre/versions.txt

COPY /cre/nginx-php.conf /etc/nginx/conf.d/default.conf
COPY cre/ /cre/

# Define mountable directories.
VOLUME ["/cre/www"]

# Define working directory.
WORKDIR /cre/www

# Define default command.
ENTRYPOINT ["/cre/nginx-php-entrypoint.sh"]
CMD ["shoreman", "/cre/nginx-php-procfile"]

# Expose ports.
EXPOSE 80
