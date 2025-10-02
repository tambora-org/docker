# Adapted from https://github.com/phpmyadmin/docker
FROM tamboraorg/crephp:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MYADMIN_VERSION 999.999

LABEL Name="MyAdmin for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MYADMIN_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

RUN echo "phpmyadmin phpmyadmin/mysql/admin-pass password secret" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/setup-password password secret" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/password-confirm password secret" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/app-password-confirm password secret" | debconf-set-selections	
RUN echo "phpmyadmin phpmyadmin/mysql/app-pass password secret" | debconf-set-selections	
RUN echo "phpmyadmin phpmyadmin/remote/host select cremysql" | debconf-set-selections	
RUN echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/db/dbname string phpmyadmin" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/database-type select mysql" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/db/app-user string phpmyadmin@mysql" | debconf-set-selections

RUN apt-get update && \
	apt-get -y install phpmyadmin

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t crePhpMyadmin \t ${MYADMIN_VERSION}" >> /cre/versions.txt 

COPY cre /cre

# VOLUME ["/cre/www/myadmin"]
VOLUME ["/usr/share/phpmyadmin"]
# WORKDIR "/cre/www/myadmin"
WORKDIR "/cre/www"

#RUN chmod +x /cre/myadmin-entrypoint.sh

ENTRYPOINT ["/cre/myadmin-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000

##CMD ["/usr/bin/mysqld_safe"]

##CMD ["/cre/run.sh"]
## use php-procfile ...
CMD ["shoreman", "/cre/php-procfile"]
