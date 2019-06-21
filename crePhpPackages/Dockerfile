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

#move to ununtu base later
RUN apt-get update \
    && apt-get -y --no-install-recommends install bc rsync \
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
RUN composer global require --prefer-stable --update-with-all-dependencies fxp/composer-asset-plugin
RUN composer global require --prefer-stable --update-with-all-dependencies "npm-asset/jquery"
#RUN composer require --update-with-all-dependencies "npm-asset/jquery"
RUN composer global require --prefer-stable --update-with-all-dependencies npm-asset/bootstrap
#RUN composer require --update-with-all-dependencies npm-asset/bootstrap
#RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/bootstrap"

RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/bootstrap"
RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/jquery"
RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/yii2-pjax"
RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/punycode"
RUN composer require --prefer-stable --update-with-all-dependencies "bower-asset/inputmask"
RUN composer require --prefer-stable --update-with-all-dependencies "miclabs/deep-copy"
RUN composer require --prefer-stable --update-with-all-dependencies "symfony/polyfill-intl-idn"
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/php-text-template
RUN composer require --prefer-stable --update-with-all-dependencies ralouphie/getallheaders
RUN composer require --prefer-stable --update-with-all-dependencies theseer/tokenizer
RUN composer require --prefer-stable --update-with-all-dependencies phpdocumentor/type-resolver
RUN composer require --prefer-stable --update-with-all-dependencies phar-io/version


#RUN composer require letudiant/composer-shared-package-plugin


# yii3
## needs php 7.2 AND conflicts with yii2

RUN composer require --prefer-stable --update-with-all-dependencies php-extended/php-http-message-factory-psr17


RUN composer require --prefer-stable --update-with-all-dependencies ezyang/htmlpurifier:~4.1.0
RUN composer require --prefer-stable --update-with-all-dependencies ext-intl
##RUN composer require --prefer-stable --update-with-all-dependencies vlucas/phpdotenv

RUN composer require --prefer-stable --update-with-all-dependencies twig/twig
RUN composer require --prefer-stable --update-with-all-dependencies psr/container

RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-handler
RUN composer require --prefer-stable --update-with-all-dependencies psr/http-server-middleware

RUN composer require --prefer-stable --update-with-all-dependencies codeception/base:~2.3.9
RUN composer require --prefer-stable --update-with-all-dependencies codeception/verify:~0.4.0
RUN composer require --prefer-stable --update-with-all-dependencies codeception/stub:~1.0.4
RUN composer require --prefer-stable --update-with-all-dependencies behat/gherkin
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/phpunit
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/php-invoker
RUN composer require --prefer-stable --update-with-all-dependencies symfony/browser-kit

RUN composer require --prefer-stable --update-with-all-dependencies true/punycode
#RUN composer require --prefer-stable --update-with-all-dependencies ext-soap (*)
RUN composer require --prefer-stable --update-with-all-dependencies symfony/process
RUN composer require --prefer-stable --update-with-all-dependencies symfony/dependency-injection
RUN composer require --prefer-stable --update-with-all-dependencies symfony/http-kernel
RUN composer require --prefer-stable --update-with-all-dependencies symfony/lock
RUN composer require --prefer-stable --update-with-all-dependencies symfony/process
#RUN composer require --prefer-stable --update-with-all-dependencies ext-uopz (*)
RUN composer require --prefer-stable --update-with-all-dependencies phpunit/php-invoker 
RUN composer require --prefer-stable --update-with-all-dependencies aws/aws-sdk-php 
RUN composer require --prefer-stable --update-with-all-dependencies codeception/phpbuiltinserver 
RUN composer require --prefer-stable --update-with-all-dependencies flow/jsonpath 
RUN composer require --prefer-stable --update-with-all-dependencies phpseclib/phpseclib 
RUN composer require --prefer-stable --update-with-all-dependencies league/factory-muffin 
RUN composer require --prefer-stable --update-with-all-dependencies league/factory-muffin-faker 
RUN composer require --prefer-stable --update-with-all-dependencies symfony/phpunit-bridge
RUN composer require --prefer-stable --update-with-all-dependencies stecman/symfony-console-completion 


RUN if [ $(echo " $PHP_VERSION < 7.2" | bc) -eq 1 ] ; then echo "old php" && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2 && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap4 && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-debug:~2.1.5 && \ 
 composer require --dev --prefer-stable --update-with-all-dependencies yiisoft/yii2-gii:~2.1.0 && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-app-basic && \ 
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-queue && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-swiftmailer && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-bootstrap && \
 composer require --prefer-stable --update-with-all-dependencies yiisoft/yii2-faker \
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



##Real fails yii3
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-dev
##RUN composer require --prefer-stable --update-with-all-dependencies yiisoft/yii-twig
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-factory-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies hiqdev/composer-config-plugin
##RUN composer require --prefer-stable --update-with-all-dependencies psr/container-implementation
##RUN composer require --prefer-stable --update-with-all-dependencies psr/http-message-implementation

## real fails yii2 - not exist
RUN composer require --prefer-stable --update-with-all-dependencies codeception/specify:~0.4.6


RUN composer install
RUN composer update
RUN composer global install
RUN composer global update


COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
VOLUME ["/cre/php/packages"]

ENTRYPOINT ["/cre/php-packages-entrypoint.sh"]
