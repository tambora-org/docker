#!/bin/sh 

sleep 0.2
if [ /cre/proxy.conf -nt /etc/nginx/conf.d/default.conf ]
then
   cp -f /cre/proxy.conf /etc/nginx/conf.d/default.conf
   sleep 0.1
   nginx -s reload
fi
