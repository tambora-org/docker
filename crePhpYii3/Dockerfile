# Adapted from 
FROM tamboraorg/crephpdev:2012.0
#FROM tamboraorg/crephppackages:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV YII_VERSION 3.0.0

LABEL Name="Yii3 for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$YII_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 


# Install rsync - move to ubuntu later
RUN apt-get update \
    && apt-get -y --no-install-recommends install rsync \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpYii \t ${YII_VERSION}" >> /cre/versions.txt 

COPY cre /cre

#rm -Rf /cre/tmp/yii
# mkdir -p /cre/tmp/yii && 
##RUN composer create-project --prefer-dist yiisoft/yii2-app-basic /cre/tmp/yii 
# move to www in entry-point

#config/web.php

##VOLUME ["/cre/www/yii"]
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/yii3-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
