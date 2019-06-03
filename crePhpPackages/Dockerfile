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

RUN composer config minimum-stability dev
RUN composer config prefer-stable true

#RUN composer global require letudiant/composer-shared-package-plugin
# yii2
#RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-app-basic 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-swiftmailer
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-debug
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-gii
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-faker
RUN composer global require --prefer-stable --update-with-all-dependencies codeception/base
RUN composer global require --prefer-stable --update-with-all-dependencies phpunit/phpunit
RUN composer global require --prefer-stable --update-with-all-dependencies codeception/verify
RUN composer global require --prefer-stable --update-with-all-dependencies symfony/browser-kit
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii2-queue

# yii3
##bower-asset/jquery
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-project-template 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-core
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-web
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-cli
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-base-api
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap4
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-bootstrap3
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-jquery
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-console
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/cache
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/di
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/log
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/log-target-file
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/log-target-db 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/rbac
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/view   
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-dataview 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-captcha
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-masked-input
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-swiftmailer
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-auth-client   
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-debug
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-gii
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-dev
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-twig
RUN composer global require --prefer-stable --update-with-all-dependencies hiqdev/composer-config-plugin
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/arrays
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/strings
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db-mysql
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db-sqlite
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db-mongodb 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db-elasticsearch 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db-pgsql 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/mutex  
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-mysql 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/mutex-db-pgsql 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/mutex-file 
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-console
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-web
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/yii-rest
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/active-record
RUN composer global require --prefer-stable --update-with-all-dependencies ezyang/htmlpurifier
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/db
RUN composer global require --prefer-stable --update-with-all-dependencies ext-intl
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/event-dispatcher
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/router
RUN composer global require --prefer-stable --update-with-all-dependencies yiisoft/router-fastroute


RUN composer global install
#RUN composer global update

COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
