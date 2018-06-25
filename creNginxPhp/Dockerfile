#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginxphp
#

# Pull base image.
FROM tamboraorg/crenginx:2010.0

COPY /cre/php-nginx.conf /etc/nginx/conf.d/default.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/conf.d", "/var/log/nginx", "/cre/www"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
