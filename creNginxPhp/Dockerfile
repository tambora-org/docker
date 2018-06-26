#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginxphp
#

# Pull base image.
FROM tamboraorg/crenginx:2010.0

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creNginxPhp \t " >> /cre/versions.txt

COPY /cre/php-nginx.conf /etc/nginx/conf.d/default.conf

# Define mountable directories.
VOLUME ["/cre/www"]

# Define working directory.
WORKDIR /cre/www

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
#EXPOSE 443
