#!/bin/sh 

sleep 0.25
if [ /cre/proxy.conf -nt /etc/nginx/conf.d/default.conf ]
then
   cp -f /cre/proxy.conf /etc/nginx/conf.d/default.conf
   sleep 0.25
   nginx -s reload
fi
