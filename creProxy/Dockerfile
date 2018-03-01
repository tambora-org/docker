#FROM nginx:latest
FROM tamboraorg/crenginx
 
#Adapted from https://github.com/jwilder/nginx-proxy

RUN touch /usr/local/bin/mkc5.txt

RUN apt-get update; apt-get install -y openssl

COPY app/network_internal.conf /etc/nginx/

COPY app /app
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["shoreman", "start", "-r"]

