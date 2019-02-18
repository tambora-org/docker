#!/bin/sh 

if ! [ -e /cre/glue/proxy.conf ]
then
   cp -f /cre/glue/nginx-php.conf /etc/nginx/conf.d/default.conf
   nginx -s reload
fi
