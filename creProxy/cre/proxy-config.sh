#!/bin/sh 

if [ -e /cre/proxy.conf ]
then
   cp -f /cre/proxy.conf /etc/nginx/conf.d/default.conf
   sleep 0.1
   nginx -s reload
fi
