#!/bin/sh 

if [ /cre/nginx-php.conf -nt /etc/nginx/conf.d/default.conf ]
then
   cp -f /cre/nginx-php.conf /etc/nginx/conf.d/default.conf
   nginx -s reload
fi
