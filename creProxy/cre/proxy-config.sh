#!/bin/sh 

if ! [ -e /cre/glue/proxy.conf ]
then
   cp -f /cre/glue/proxy.conf /etc/nginx/conf.d/default.conf
   nginx -s reload
fi
