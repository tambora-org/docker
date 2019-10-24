#
# Nginx Dockerfile
#
# https://github.com/tamboraorg/docker/crenginx
# https://github.com/emilybache/vsftpd-server/blob/master/Dockerfile
# https://help.ubuntu.com/community/vsftpd
# https://askubuntu.com/questions/575523/how-to-setup-virtual-users-for-vsftpd-with-access-to-a-specific-sub-directory

# Pull base image.
FROM tamboraorg/creubuntu:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ENV FTP_VERSION 9999.9999 

#ENV FTP_USER ftpuser
#ENV FTP_PASSWORD changeme

RUN apt-get update && \
    apt-get install -y vsftpd apache2-utils libpam-pwdfile && \
    mkdir -p /var/run/vsftpd/empty

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creFtp \t $(FTP_VERSION)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t vsftpd \t $(vsftpd -v)" >> /cre/versions.txt 

COPY cre /cre
#ADD cre/vsftpd.conf /etc/vsftpd.conf
COPY cre/vsftpd.pam /etc/pam.d/vsftpd

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

