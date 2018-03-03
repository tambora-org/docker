FROM tamboraorg/crenginx
 
#Adapted from https://github.com/jwilder/nginx-proxy

RUN mkdir -p /app && touch /app/versions.txt && \
    echo "$(date +'%F %R') \t creProxy \t " >> /app/versions.txt

#RUN apt-get update; apt-get install -y openssl
RUN add-apt-repository ppa:certbot/certbot; apt-get update; apt-get install -y openssl python-certbot-nginx

RUN echo "$(date +'%F %R') \t  $(openssl version)" >> /app/versions.txt
RUN echo "$(date +'%F %R') \t  $(/usr/local/bin/certbot-auto --version)" >> /app/versions.txt
# RUN ./certbot-auto --install-only 
# ./cerbot-auto --no-self-upgrade ; certbot --nginx
 
COPY app/network_internal.conf /etc/nginx/

COPY app /app
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["shoreman", "/app/Procfile"]
