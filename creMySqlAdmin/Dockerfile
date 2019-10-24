# Adapted from https://github.com/phpmyadmin/docker
FROM tamboraorg/cremysql:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MYADMIN_VERSION 999.999

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

VOLUME /var/lib/mysql
VOLUME ["/cre/www/myadmin"]
WORKDIR "/cre/www/myadmin"


#RUN chmod +x /cre/myadmin-entrypoint.sh

ENTRYPOINT ["/cre/myadmin-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 9000
# Open mysql
EXPOSE 3306

##CMD ["/usr/bin/mysqld_safe"]

CMD ["/cre/run.sh"]
