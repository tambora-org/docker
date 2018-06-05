#!/bin/sh 
 
if ! [ -e /etc/letsencrypt/live/dhparam.pem ]
then
   openssl dhparam -out /etc/letsencrypt/live/dhparam.pem 4096
fi



