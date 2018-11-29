# Adapted from https://github.com/phpmyadmin/docker
FROM tamboraorg/crephp:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV SURVEY_VERSION 3.15.5
ENV LS_DOWNLOAD '2513:limesurvey3155+181115'
ENV LS_SHA256 ee34369cecd5965b318ed7b2123fa1c66d166a83e89090bd99b7c98758fd22d6

#https://github.com/LimeSurvey/LimeSurvey/archive/master.zip
# https://www.limesurvey.org/stable-release?download=2513:limesurvey3155+181115targz
# ee34369cecd5965b318ed7b2123fa1c66d166a83e89090bd99b7c98758fd22d6


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpSurvey \t ${SURVEY_VERSION}" >> /cre/versions.txt 

COPY cre /cre

RUN echo "${LS_SHA256} limesurvey.tar.gz" > survey256.txt 
RUN curl -o limesurvey.tar.gz -L https://www.limesurvey.org/stable-release?download=${LS_DOWNLOAD}targz \
        && sha256sum --status --strict -c survey256.txt && touch ok.txt
	&& mkdir limetmp \
	&& tar -zxf limesurvey.tar.gz -C limetmp \
	&& rm limesurvey.tar.gz \
	&& LIME_TAG=$(ls limetmp) \
	&& mv limetmp/$LIME_TAG /cre/www/survey \
	&& rm -rf limetmp \
	&& chown -R www-data:www-data /cre/www/survey 

#	&& mkdir -p /uploadstruct \
#	&& cp -r /cre/www/survey/upload/* /uploadstruct \
#	&& chown -R www-data:www-data /uploadstruct \
#       && chown www-data:www-data /var/lib/php5


VOLUME ["/cre/www/survey"]
#VOLUME ["/usr/share/phpmyadmin"]
# WORKDIR "/cre/www/myadmin"
WORKDIR "/cre/www"

ENTRYPOINT ["/cre/survey-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

CMD ["shoreman", "/cre/php-procfile"]
