#!/bin/sh 

sleep 0.2
if [ /cre/nginx.conf -nt /etc/nginx/conf.d/default.conf ]
then
   cp -f /cre/nginx.conf /etc/nginx/conf.d/default.conf
   sleep 0.1
   nginx -s reload
fi
