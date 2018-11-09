#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginx
# https://github.com/emilybache/vsftpd-server/blob/master/Dockerfile

# Pull base image.
FROM tamboraorg/creubuntu:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV FTP_VERSION 9999.9999 

#ENV FTP_USER ftpuser
#ENV FTP_PASSWORD changeme

RUN apt-get update && \
    apt-get install -y vsftpd && \
    mkdir -p /var/run/vsftpd/empty

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creFtp \t $(FTP_VERSION)" >> /cre/versions.txt 

COPY cre /cre
ADD cre/vsftpd.conf /etc/vsftpd.conf

VOLUME ["/cre/ftp"]
WORKDIR "/cre/ftp"


##RUN mkdir /ftp
##VOLUME ["/ftp"]

EXPOSE 20 21
EXPOSE 12020 12021 12022 12023 12024 12025

##ENTRYPOINT ["/usr/local/bin/start.sh"]



# Define default command.
ENTRYPOINT ["/cre/ftp-entrypoint.sh"]
#CMD ["/cre/run.sh"]
CMD ["shoreman", "/cre/ftp-procfile"]

