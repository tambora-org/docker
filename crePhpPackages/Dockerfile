#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephppackages
#

# Pull base image.
FROM tamboraorg/crephpdev:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

LABEL Name="Php Packages for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PHP_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

#move to ununtu base later
RUN apt-get update \
    && apt-get -y --no-install-recommends install bc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*


RUN mkdir -p /cre/tmp/php/packages
#RUN echo "{}" > /cre/tmp/php/packages/composer.json
COPY cre/empty-composer.json /cre/tmp/php/packages/composer.json
RUN cd /cre/tmp/php/packages
WORKDIR "/cre/tmp/php/packages"

RUN composer global config minimum-stability dev
RUN composer global config prefer-stable true
RUN composer global config repositories.npm composer https://asset-packagist.org

RUN composer config minimum-stability dev
RUN composer config prefer-stable true
#RUN composer config repositories.npm composer https://asset-packagist.org
RUN composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}'

# npm
RUN composer require --prefer-stable --update-with-all-dependencies "foxy/foxy"
RUN composer global require --prefer-stable --update-with-all-dependencies "npm-asset/jquery"
#RUN composer require --update-with-all-dependencies "npm-asset/jquery"
RUN composer global require --prefer-stable --update-with-all-dependencies npm-asset/bootstrap
#RUN composer require --update-with-all-dependencies npm-asset/bootstrap
#RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/bootstrap"

#RUN composer require letudiant/composer-shared-package-plugin


# yii3
## needs php 7.2 AND conflicts with yii2

RUN composer require --prefer-stable --update-with-all-dependencies php-extended/php-http-message-factory-psr17


RUN composer require --prefer-stable --update-with-all-dependencies ezyang/htmlpurifier
RUN composer require --prefer-stable --update-with-all-dependencies ext-intl
##RUN composer require --prefer-stable --update-with-all-dependencies vlucas/phpdotenv

RUN composer require --prefer-stable --update-with-all-dependencies twig/twig
RUN composer require --prefer-stable --update-with-all-dependencies psr/container

RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-handler
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-middleware



RUN if [ $(echo " $PHP_VERSION < 7.2" | bc) -eq 1 ] ; then echo "old php" && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2 \ 
; else echo "new php" && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/di && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/view && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/log && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/cache && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/rbac && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-core && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-web && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-cli && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-api && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap4 && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap3 && \      
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-jquery && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/log-target-file && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/log-target-db && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-captcha && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-masked-input && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-swiftmailer && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-auth-client && \    
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-debug && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-gii && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/arrays && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/strings && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db-mysql && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db-sqlite && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db-mongodb && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db-elasticsearch && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/db-pgsql && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex && \   
 composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-mysql && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-pgsql && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-file && \  
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-web && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-rest && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/active-record && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/event-dispatcher && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/router && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/router-fastroute && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-project-template  && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/var-dumper \ 
; fi



##Real fails
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dev
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-twig
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies hiqdev/composer-config-plugin
##RUN composer require --prefer-stable --update-with-all-dependencies psr/container-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message-implementation

## real fails yii2 - not exist
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap3
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap
# RUN composer require --prefer-stable --update-with-all-dependencies codeception/specify

# yii2

# Not loaded from cache ???
RUN composer require --prefer-stable --update-with-all-dependencies codeception/base
RUN composer require --prefer-stable --update-with-all-dependencies codeception/verify
RUN composer require --prefer-stable --update-with-all-dependencies codeception/stub
RUN composer require --prefer-stable --update-with-all-dependencies behat/gherkin
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/phpunit
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/php-invoker
RUN composer require --prefer-stable --update-with-all-dependencies symfony/browser-kit

RUN composer require --prefer-stable --update-with-all-dependencies true/punycode

#Real conflicts with yii3
# also needs mcrypt, php < 7.2

###Possible Conflicts with yii3
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-debug 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-gii
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-app-basic 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-queue
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-swiftmailer
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-faker
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap4


RUN composer install
RUN composer update
RUN composer global install
RUN composer global update


COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
VOLUME ["/cre/php/packages"]

ENTRYPOINT ["/cre/php-packages-entrypoint.sh"]
