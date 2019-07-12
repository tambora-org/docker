#!/usr/bin/env bash 

if [ $(echo " $PHP_VERSION < 7.2" | bc) -eq 1 ] ; then
  /usr/sbin/php-fpm7.0 -F -O 2>&1 | sed -u 's,.*: \"\(.*\)$,\1,'| sed -u 's,"$,,' 1>&1
else
  /usr/sbin/php-fpm7.2 -F -O 2>&1 | sed -u 's,.*: \"\(.*\)$,\1,'| sed -u 's,"$,,' 1>&1
fi

#or use if file exists -e 
