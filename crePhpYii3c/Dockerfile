# Adapted from 
FROM tamboraorg/crephpdev:0.2020
#FROM tamboraorg/crephppackages:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV YII_VERSION 3.0.0

LABEL Name="Yii3 for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$YII_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 


# Install rsync - move to ubuntu later
RUN apt-get update \
    && apt-get -y --no-install-recommends install rsync \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpYii \t ${YII_VERSION}" >> /cre/versions.txt 

COPY cre /cre

## template
RUN rm -Rf /cre/tmp/yii && mkdir -p /cre/tmp/yii \
 && composer create-project --prefer-dist --stability=dev yiisoft/yii-project-template /cre/tmp/yii 
 
RUN cd /cre/tmp/yii \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/di \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-web \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-rest \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap4 \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-captcha \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-http-client \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-auth-client \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-debug \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/db-mysql \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/db-pgsql \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/db-sqlite \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/db-elasticsearch \
 && composer require --prefer-stable --update-with-all-dependencies "foxy/foxy:^1.0.0" \
 && composer require --prefer-stable --update-with-all-dependencies jaeger/querylist 

RUN cd /cre/tmp/yii \
 && composer require --prefer-stable --update-with-all-dependencies cebe/markdown \
 && composer require --prefer-stable --update-with-all-dependencies cycle/proxy-factory \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/composer-config-plugin \
 && composer require --prefer-stable --update-with-all-dependencies nyholm/psr7 \
 && composer require --prefer-stable --update-with-all-dependencies psr/log \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/access \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/aliases \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/arrays \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/assets \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/auth \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/cache \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/data \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/di \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/event-dispatcher \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/factory \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/html \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/injector \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/log \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/log-target-file \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/mailer \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/mailer-swiftmailer \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/router \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/router-fastroute \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/security \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/strings \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/var-dumper \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/view \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/widget \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap4 \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-cycle \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-web \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-debug \
 && composer require --prefer-stable --update-with-all-dependencies yiisoft/serializer 


## yiisoft/yii-queue
## yiisoft/yii-masked-input
# onmotion/yii2-vuejs-assets

RUN cd /cre/tmp/yii \
 && composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}' \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vue \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vue-router \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vue-resource \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vuex \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vuex-persistedstate \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/axios \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vue-notification \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/vue-js-modal \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/primevue \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/primeicons \
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/leaflet \ 
 && composer require --prefer-stable --update-with-all-dependencies npm-asset/jquery 
## vue2-leaflet

## && composer require --prefer-stable --update-with-all-dependencies npm-asset/ol 
## && composer require --prefer-stable --update-with-all-dependencies npm-asset/d3 

# sync to www in entry-point

#config/web.php

RUN cd /cre/tmp/yii && composer install && composer dump-autoload

##VOLUME ["/cre/www/yii"]
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/yii3-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
