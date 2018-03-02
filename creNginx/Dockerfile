#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginx
#

# Pull base image.
FROM tamboraorg/creubuntu

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  sed -i 's/worker_processes  1/worker_processes  auto/' /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN mkdir -p /app && touch /app/versions.txt && \
    echo "$(date +'%F xx %R%t') creNginx $(/usr/sbin/nginx -v)" >> /app/versions.txt

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
