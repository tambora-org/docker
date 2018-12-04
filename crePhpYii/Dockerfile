# Adapted from 
FROM tamboraorg/crephpdev:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV YII_VERSION 3.15.5

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpYii \t ${YII_VERSION}" >> /cre/versions.txt 

COPY cre /cre

RUN composer create-project --prefer-dist yiisoft/yii2-app-basic /cre/yiitmp && \
 YII_TAG=$(ls /cre/yiitmp) && mv /cre/yiitmp/$YII_TAG /cre/www/yii 
# rm /cre/yiitmp

#config/web.php

VOLUME ["/cre/www/yii"]
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/yii-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
