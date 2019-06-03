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

RUN composer global require letudiant/composer-shared-package-plugin
RUN composer global require --optimize-autoloader yiisoft/yii2-app-basic  #yii2
RUN composer global require --optimize-autoloader yiisoft/yii-project-template #yii3
RUN composer global require --optimize-autoloader yiisoft/yii-base-web         #yii3

RUN composer global install
#RUN composer global update

COPY cre /cre

#VOLUME ["/cre/www"]
WORKDIR "/cre/php/packages"
