#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginx
# 

# Pull base image.
FROM tamboraorg/creubuntu:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV NGINX_VERSION 1.14.1

LABEL Name="Nginx for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$NGINX_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install Nginx
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  rm /etc/nginx/sites-enabled/default && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  sed -i 's/worker_processes  1/worker_processes  auto/' /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# https://blog.marvin-menzerath.de/artikel/docker-ufw-iptables-ports-nicht-automatisch-oeffnen/
# RUN ufw app list && ufw allow 'Nginx Full' && ufw status

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creNginx \t $(/usr/sbin/nginx -v 2>&1 | sed -e "s/^nginx version: nginx\///" )" >> /cre/versions.txt 

COPY cre/nginx.conf /etc/nginx/conf.d/default.conf
# Define working directory.
COPY cre /cre
WORKDIR /cre/
#WORKDIR /etc/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/conf.d", "/var/log/nginx", "/cre/www"]

# Expose ports (done by children). 
#EXPOSE 80
#EXPOSE 443

# Define default command.
#CMD ["nginx"]
ENTRYPOINT ["/cre/nginx-entrypoint.sh"]
CMD ["shoreman", "/cre/nginx-procfile"]

