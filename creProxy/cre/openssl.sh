#!/bin/sh 

if ! [ -e /etc/letsencrypt/openssl/dhparam.pem ]
then
   openssl dhparam -out /etc/letsencrypt/openssl/dhparam.pem 4096
fi



