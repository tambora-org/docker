# Adapted from 
FROM tamboraorg/crephpdev:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV YII_VERSION 3.15.5
#ENV LS_DOWNLOAD '2513:limesurvey3155+181115'
#ENV LS_SHA256 ee34369cecd5965b318ed7b2123fa1c66d166a83e89090bd99b7c98758fd22d6

#https://github.com/LimeSurvey/LimeSurvey/archive/master.zip
# https://www.limesurvey.org/stable-release?download=2513:limesurvey3155+181115targz
# ee34369cecd5965b318ed7b2123fa1c66d166a83e89090bd99b7c98758fd22d6


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpYii \t ${YII_VERSION}" >> /cre/versions.txt 

COPY cre /cre

RUN mkdir yiitmp && cd ./yiitmp \
 && composer create-project --prefer-dist yiisoft/yii2-app-basic basic \
 && mv -Rf ./yiitmp/*  /cre/www/yii
#config/web.php

VOLUME ["/cre/www/yii"]
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/yii-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
