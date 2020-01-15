# Adapted from https://github.com/qgis/QGIS-Web-Client
# and https://github.com/opengisch/QGIS-Web-Client
FROM tamboraorg/creubuntu:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV QGIS_VERSION 3.4.11

LABEL Name="QGIS for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$QGIS_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

#RUN add-apt-repository ppa:ubuntugis/ppa
##RUN echo "deb http://qgis.org/debian xenial main" >> /etc/apt/sources.list
##RUN echo "deb-src http://qgis.org/debian xenial main" >> /etc/apt/sources.list


RUN apt-get -y update
RUN apt-get install -y -q --no-install-recommends qgis qgis-server python-qgis 
RUN apt-get install -y -q --no-install-recommends qgis-mapserver
RUN apt-get install -y -q --no-install-recommends spawn-fcgi
##qgis-plugin-grass


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creQgis \t $QGIS_VERSION" >> /cre/versions.txt  

COPY cre /cre
WORKDIR /cre/

EXPOSE 9993

#USER postgres

#ENTRYPOINT ["/cre/postgres-entrypoint.sh"]

CMD ["shoreman", "/cre/qgis-procfile"]

