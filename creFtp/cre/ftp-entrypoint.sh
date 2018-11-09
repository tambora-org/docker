#!/bin/bash
set -e

echo "FTP entry"

if [ $1 == 'no-bootstrap' ]; then
  exec bash
fi

if ( id ${FTP_USER} ); then
  echo "User ${FTP_USER} already exists"
else
  echo "Creating user ${FTP_USER}"
  ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${FTP_PASSWORD})
  useradd -d /cre/ftp/${FTP_USER} -m -p ${ENC_PASS} -u 1000 -s /bin/sh ${FTP_USER}
fi

if [ $1 == 'vsftpd' ]; then
  exec vsftpd
else
  exec $@
fi

#exec "$@"
