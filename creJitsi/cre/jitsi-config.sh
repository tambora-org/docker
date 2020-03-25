#!/bin/sh 

sleep 0.2
if [ /cre/nginx-php.conf -nt /etc/nginx/conf.d/default.conf ]
then
   cp -f /cre/nginx-php.conf /etc/nginx/conf.d/default.conf
   sleep 0.1
   nginx -s reload
fi
