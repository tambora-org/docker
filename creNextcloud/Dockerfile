#
# Nextcloud Dockerfile
#
# https://github.com/tamboraorg/docker/crenextcloud
#

# Pull base image. 
FROM tamboraorg/crephp:2010.0 
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8

ENV NEXTCLOUD_VERSION 9.0.58

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creNextcloud \t $NEXTCLOUD_VERSION " >> /cre/versions.txt

COPY cre/ /cre/
 
RUN chown -R www-data:root /cre/www/nextcloud && \
    chmod -R g=u /cre/www/nextcloud 
VOLUME /cre/www/nextcloud 

RUN curl -fsSL -o nextcloud.tar.bz2 \
    "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2" \
 && curl -fsSL -o nextcloud.tar.bz2.asc \
    "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2.asc" \
 && export GNUPGHOME="$(mktemp -d)" \
# gpg key from https://nextcloud.com/nextcloud.asc
 && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 28806A878AE423A28372792ED75899B9A724937A \
 && gpg --batch --verify nextcloud.tar.bz2.asc nextcloud.tar.bz2 \
 && rm -r "$GNUPGHOME" nextcloud.tar.bz2.asc \
 && tar -xjf nextcloud.tar.bz2 -C /usr/src/ \
 && rm nextcloud.tar.bz2 \
 && rm -rf /usr/src/nextcloud/updater \
 && mkdir -p /usr/src/nextcloud/data \
 && mkdir -p /usr/src/nextcloud/custom_apps \
 && chmod +x /usr/src/nextcloud/occ

COPY config/* /usr/src/nextcloud/config/

COPY cre /cre
WORKDIR /cre/

ENTRYPOINT ["/cre/nextcloud-entrypoint.sh"]

#CMD ["shoreman", "/cre/nextcloud-procfile"]
CMD /cre/php-fpm.sh