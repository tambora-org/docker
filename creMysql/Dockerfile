# Adapted from https://github.com/Leafney/ubuntu-mysql
FROM tamboraorg/creubuntu:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MYSQL_VERSION 5.7

LABEL Name="MySql for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MYSQL_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

##VOLUME /var/lib/mysql

RUN apt-get update && \
	apt-get -y install mysql-server && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	mkdir -p /var/log/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/log/mysql


# UTF-8 and bind-address
RUN sed -i -e "$ a [client]\n\n[mysql]\n\n[mysqld]"  /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysqld\]\)/\1\ninit_connect='SET NAMES utf8'\ncharacter-set-server = utf8\ncollation-server=utf8_unicode_ci\nbind-address = 0.0.0.0/g" /etc/mysql/my.cnf

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creMysql \t $(/usr/bin/mysql --version)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/

VOLUME /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/cre/mysql-entrypoint.sh"]

EXPOSE 3306

#CMD ["/cre/run.sh"]
CMD ["shoreman", "/cre/mysql-procfile"]
