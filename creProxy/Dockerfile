#FROM nginx:latest
FROM tamboraorg/crenginx
 
#Adapted from https://github.com/jwilder/nginx-proxy

RUN mkdir -p /app && touch /app/versions.txt && \
    echo "$(date +'%F %R%t') creProxy" >> /app/versions.txt

RUN apt-get update; apt-get install -y openssl

RUN echo "$(date +'%F %R%t') $(openssl version)" >> /app/versions.txt


RUN mkdir -p /app && touch /app/versions.txt && \
    echo -e "$(date +'%F %R') \t creUbuntuT \t $(cat /usr/lib/os-release | grep PRETTY)" >> /app/versions.txt


COPY app/network_internal.conf /etc/nginx/

COPY app /app
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["shoreman", "/app/Procfile"]
