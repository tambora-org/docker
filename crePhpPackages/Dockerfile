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

#RUN composer global require letudiant/composer-shared-package-plugin
# yii2
RUN composer global require --optimize-autoloader yiisoft/yii2-app-basic 
RUN composer global require --optimize-autoloader yiisoft/yii2
RUN composer global require --optimize-autoloader yiisoft/yii2-bootstrap
RUN composer global require --optimize-autoloader yiisoft/yii2-swiftmailer
RUN composer global require --optimize-autoloader yiisoft/yii2-debug
RUN composer global require --optimize-autoloader yiisoft/yii2-gii
RUN composer global require --optimize-autoloader yiisoft/yii2-faker
RUN composer global require --optimize-autoloader codeception/base
RUN composer global require --optimize-autoloader phpunit/phpunit
RUN composer global require --optimize-autoloader codeception/verify
RUN composer global require --optimize-autoloader symfony/browser-kit

# yii3
RUN composer global require --optimize-autoloader yiisoft/yii-project-template 
RUN composer global require --optimize-autoloader yiisoft/yii-core
RUN composer global require --optimize-autoloader yiisoft/yii-base-web
RUN composer global require --optimize-autoloader yiisoft/yii-base-cli
RUN composer global require --optimize-autoloader yiisoft/yii-base-api
RUN composer global require --optimize-autoloader yiisoft/yii-dataview
RUN composer global require --optimize-autoloader yiisoft/yii-bootstrap4
RUN composer global require --optimize-autoloader yiisoft/yii-bootstrap3
RUN composer global require --optimize-autoloader yiisoft/yii-jquery
RUN composer global require --optimize-autoloader yiisoft/yii-console
RUN composer global require --optimize-autoloader yiisoft/cache
RUN composer global require --optimize-autoloader yiisoft/di
RUN composer global require --optimize-autoloader yiisoft/log
RUN composer global require --optimize-autoloader yiisoft/log-target-file
RUN composer global require --optimize-autoloader yiisoft/log-target-db 
RUN composer global require --optimize-autoloader yiisoft/rbac
RUN composer global require --optimize-autoloader yiisoft/view   
RUN composer global require --optimize-autoloader yiisoft/yii-dataview 
RUN composer global require --optimize-autoloader yiisoft/yii-captcha
RUN composer global require --optimize-autoloader yiisoft/yii-masked-input
RUN composer global require --optimize-autoloader yiisoft/yii-swiftmailer
RUN composer global require --optimize-autoloader yiisoft/yii-auth-client   
RUN composer global require --optimize-autoloader yiisoft/yii-debug
RUN composer global require --optimize-autoloader yiisoft/yii-gii
RUN composer global require --optimize-autoloader yiisoft/yii-dev
RUN composer global require --optimize-autoloader yiisoft/yii-twig
RUN composer global require --optimize-autoloader hiqdev/composer-config-plugin
RUN composer global require --optimize-autoloader yiisoft/arrays
RUN composer global require --optimize-autoloader yiisoft/strings
RUN composer global require --optimize-autoloader yiisoft/db-mysql
RUN composer global require --optimize-autoloader yiisoft/db-sqlite
RUN composer global require --optimize-autoloader yiisoft/db-mongodb 
RUN composer global require --optimize-autoloader yiisoft/db-elasticsearch 
RUN composer global require --optimize-autoloader yiisoft/db-pgsql 
RUN composer global require --optimize-autoloader yiisoft/mutex  
RUN composer global require --optimize-autoloader yiisoft/mutex-db-mysql 
RUN composer global require --optimize-autoloader yiisoft/mutex-db-pgsql 
RUN composer global require --optimize-autoloader yiisoft/mutex-file 
RUN composer global require --optimize-autoloader yiisoft/yii-console
RUN composer global require --optimize-autoloader yiisoft/yii-web
RUN composer global require --optimize-autoloader yiisoft/yii-rest
RUN composer global require --optimize-autoloader yiisoft/active-record
RUN composer global require --optimize-autoloader ezyang/htmlpurifier
RUN composer global require --optimize-autoloader yiisoft/db
RUN composer global require --optimize-autoloader ext-intl

RUN composer global install
#RUN composer global update

COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
