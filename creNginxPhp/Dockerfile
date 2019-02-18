#
# Nginx Php Dockerfile
#
# https://github.com/tamboraorg/docker/crenginxphp
#

# Pull base image.
FROM tamboraorg/crenginx:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

# version: yyyy.n for stable versions / 0.yyyy for development
#ENV CRE_VERSION 0.2010 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creNginxPhp \t " >> /cre/versions.txt

COPY /cre/nginx-php.conf /etc/nginx/conf.d/default.conf
COPY cre/ /cre/

#ENV DOCKER_HOST unix:///tmp/docker.sock

# Define mountable directories.
VOLUME ["/cre/www"]

# Define working directory.
WORKDIR /cre/www

# Define default command.
#CMD ["nginx"]
ENTRYPOINT ["/cre/nginx-php-entrypoint.sh"]
CMD ["shoreman", "/cre/nginx-php-procfile"]

# Expose ports.
EXPOSE 80
