#!/bin/bash
set -e

echo "FTP entry"

if ! [ -e /etc/ssl/private/vsftpd.combine.pem ]
then
   openssl req -batch -config /cre/openssl.ftp.cfg -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.combine.pem -out /etc/ssl/private/vsftpd.combine.pem
fi

if [ $1 == 'no-bootstrap' ]; then
  exec bash
fi

if ( id ${FTP_USER} ); then
  echo "User ${FTP_USER} already exists"
else
  echo "Creating user ${FTP_USER}"
  ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${FTP_PASSWORD})
  useradd -d /cre/ftp/${FTP_USER} -m -p ${ENC_PASS} -u 1000 -s /bin/sh ${FTP_USER}
  echo "${FTP_USER}" | tee -a /cre/ftp.users
fi

if [ $1 == 'vsftpd' ]; then
  exec vsftpd
else
  exec $@
fi

#exec "$@"
