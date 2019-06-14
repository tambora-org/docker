#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephppackages
#

# Pull base image.
FROM tamboraorg/crephpdev:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

LABEL Name="Php Packages for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PHP_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

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


RUN echo "Current dir: $(pwd)"
RUN echo "Cja: $(cat /cre/tmp/php/packages/composer.json)"
RUN echo "Cjr: $(cat ./composer.json)"

# yii3
## needs php 7.2 AND conflicts with yii2

RUN composer require --prefer-stable --update-with-all-dependencies php-extended/php-http-message-factory-psr17

RUN echo "Current dir: $(pwd)"
RUN echo "Cja: $(cat /cre/tmp/php/packages/composer.json)"
RUN echo "Cjr: $(cat ./composer.json)"
RUN echo "LS: $(ls -l /cre/tmp/php/packages/)"


RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/di
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/view  


RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-web
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-cli
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-api
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap4
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap3
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-jquery
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console

RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/log-target-file
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/log-target-db 

RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-captcha
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-masked-input
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-swiftmailer
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-auth-client   
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-debug
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-gii

RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/arrays
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/strings
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db-mysql
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db-sqlite
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db-mongodb 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db-elasticsearch 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db-pgsql 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex  
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-mysql 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-pgsql 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/mutex-file 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-console
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-web
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-rest
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/active-record
RUN composer require --prefer-stable --update-with-all-dependencies ezyang/htmlpurifier

RUN composer require --prefer-stable --update-with-all-dependencies ext-intl
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/event-dispatcher
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/router
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/router-fastroute

RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-project-template 

##RUN composer require --prefer-stable --update-with-all-dependencies vlucas/phpdotenv

RUN composer require --prefer-stable --update-with-all-dependencies twig/twig
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/var-dumper
RUN composer require --prefer-stable --update-with-all-dependencies psr/container

RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-handler
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-middleware


#Real conflicts with yii2
#RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-core

###Possible conflicts with yii2


###Conflicts with php<7.2
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/log 

# psr/log-implementation 
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/cache
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/rbac
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/db

##Real fails
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dev
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-twig
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies hiqdev/composer-config-plugin
##RUN composer require --prefer-stable --update-with-all-dependencies psr/container-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message-implementation


# yii2

# Not loaded from cache ???
RUN composer require --prefer-stable --update-with-all-dependencies codeception/base
RUN composer require --prefer-stable --update-with-all-dependencies codeception/verify
# RUN composer require --prefer-stable --update-with-all-dependencies codeception/specify
RUN composer require --prefer-stable --update-with-all-dependencies codeception/stub
RUN composer require --prefer-stable --update-with-all-dependencies behat/gherkin

RUN composer require --prefer-stable --update-with-all-dependencies phpunit/phpunit
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/php-invoker
RUN composer require --prefer-stable --update-with-all-dependencies symfony/browser-kit

RUN composer require --prefer-stable --update-with-all-dependencies true/punycode

#Real conflicts with yii3
# also needs mcrypt, php < 7.2
RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2

###Possible Conflicts with yii3
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-debug 
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-gii
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-app-basic 
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-queue
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-swiftmailer
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap
###RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-faker


RUN composer install
RUN composer update
#RUN composer global install
#RUN composer global update


COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
VOLUME ["/cre/php/packages"]

ENTRYPOINT ["/cre/php-packages-entrypoint.sh"]
