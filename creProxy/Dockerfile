FROM tamboraorg/crenginx
 
#Adapted from https://github.com/jwilder/nginx-proxy

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creProxy \t " >> /cre/versions.txt

# Fix issue due to server_names_hash_bucket_size
# see also proxy.tmpl -  https://github.com/certbot/certbot/issues/5199
RUN sed -i 's/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 128/' /etc/nginx/nginx.conf && \
    sed -i 's/# server_names_hash_bucket_size/server_names_hash_bucket_size/' /etc/nginx/nginx.conf

RUN add-apt-repository ppa:certbot/certbot; apt-get update; apt-get install -y openssl python-certbot-nginx
RUN wget https://dl.eff.org/certbot-auto && \
    mv certbot-auto /usr/local/bin/ && \
    chmod 755 /usr/local/bin/certbot-auto
# RUN /usr/local/bin/certbot-auto --noninteractive --install-only   
#RUN /usr/local/bin/certbot-auto --noninteractive --version  

RUN echo "$(date +'%F %R') \t  $(openssl version)" >> /cre/versions.txt
RUN echo "$(date +'%F %R') \t  $(/usr/local/bin/certbot-auto --version 2>&1)" >> /cre/versions.txt

# /usr/local/bin/certbot-auto --no-self-upgrade ; 
# certbot --noninteractive --nginx --agree-tos -m mail@domain.tld --domains domain.tld
 
COPY app/network_internal.conf /etc/nginx/

COPY app /cre
WORKDIR /cre/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/cre/docker-entrypoint.sh"]
CMD ["shoreman", "/cre/Procfile"]
