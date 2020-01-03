# Adapted from https://github.com/phpmyadmin/docker
FROM tamboraorg/crephp:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV SURVEY_VERSION 3.19.3
ENV LS_DOWNLOAD '2689:limesurvey3193+191023'
ENV LS_SHA256 70072ca521afcb27ea6f23a20ac16c6b12ebdf6898ff9054d5d55393cd189ac8

#https://github.com/LimeSurvey/LimeSurvey/archive/master.zip
# https://www.limesurvey.org/stable-release?download=2513:limesurvey3155+181115targz
# ee34369cecd5965b318ed7b2123fa1c66d166a83e89090bd99b7c98758fd22d6


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpSurvey \t ${SURVEY_VERSION}" >> /cre/versions.txt 

COPY cre /cre

RUN echo "${LS_SHA256} /cre/limesurvey.tar.gz" > /cre/survey256.txt \
        && curl -o /cre/limesurvey.tar.gz -L https://www.limesurvey.org/stable-release?download=${LS_DOWNLOAD}targz \
        && sha256sum /cre/limesurvey.tar.gz > /cre/cs_ls.txt \  
#        && sha256sum --status --strict -c /cre/survey256.txt && touch /cre/ok.txt \   
	&& mkdir -p /cre/tmp/survey \
	&& tar -zxf /cre/limesurvey.tar.gz -C /cre/tmp/survey \
	&& rm -f /cre/limesurvey.tar.gz 

##	&& LIME_TAG=$(ls -d /cre/limetmp/limesurvey/*) \
##	&& mv $LIME_TAG /cre/www/survey \
#   && LIME_TAG=$(ls /cre/limetmp/limesurvey) && cd /cre/limetmp/limesurvey && mv $LIME_TAG /cre/www/survey && cd /cre \
#	&& rm -rf /cre/tmp/survey \
#	&& chown -R www-data:www-data /cre/www/survey 
#	&& mkdir -p /uploadstruct \
#	&& cp -r /cre/www/survey/upload/* /uploadstruct \
#	&& chown -R www-data:www-data /uploadstruct \
#       && chown www-data:www-data /var/lib/php5

VOLUME ["/cre/www/survey"]
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/survey-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
