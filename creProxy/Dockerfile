#
# Nginx Proxy Dockerfile
#
# https://github.com/tamboraorg/docker/creProxy
# (adapted from https://github.com/jwilder/nginx-proxy )

FROM tamboraorg/crenginx:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV CERTBOT_VERSION 0.31.0

LABEL Name="Proxy for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$CERTBOT_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Fix issue due to server_names_hash_bucket_size
# see also proxy.tmpl -  https://github.com/certbot/certbot/issues/5199
RUN sed -i 's/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 128/' /etc/nginx/nginx.conf && \
    sed -i 's/# server_names_hash_bucket_size/server_names_hash_bucket_size/' /etc/nginx/nginx.conf

RUN add-apt-repository ppa:certbot/certbot; apt-get update; apt-get install -y python-certbot-nginx
RUN wget https://dl.eff.org/certbot-auto && \
    mv certbot-auto /usr/local/bin/ && \
    chmod 755 /usr/local/bin/certbot-auto && \
    /usr/local/bin/certbot-auto --noninteractive --install-only && \
    /usr/local/bin/certbot-auto --noninteractive --version  

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creProxy \t " >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  $(/usr/local/bin/certbot-auto --noninteractive --version 2>&1)" >> /cre/versions.txt

# /usr/local/bin/certbot-auto --no-self-upgrade ; 
# certbot --noninteractive --nginx --agree-tos -m mail@domain.tld --domains domain.tld
 
COPY cre/proxy.conf /etc/nginx/conf.d/default.conf
COPY cre /cre
WORKDIR /cre/

#VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/cre/proxy-entrypoint.sh"]
CMD ["shoreman", "/cre/proxy-procfile"]


# Expose ports.
EXPOSE 80
EXPOSE 443
