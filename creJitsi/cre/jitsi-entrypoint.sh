#!/bin/bash
set -e

# TODO: If CRE_PHP_ROOT not set: use www
if [ -z $CRE_PHP_ROOT ]; then
  CRE_PHP_ROOT='www';
fi

if [ ! -d "/cre/$CRE_PHP_ROOT" ]; 
then
  mkdir -p "/cre/$CRE_PHP_ROOT"
fi

# allow redirection
for file in /cre/$CRE_PHP_ROOT/*.conf.redirect; do
  if [ -f "$file" ]; then cp -f $file /etc/nginx/conf.d/ ; fi
done

cp -f /cre/db-test.php "/cre/$CRE_PHP_ROOT/db-test.php"
cp -f /cre/info.php "/cre/$CRE_PHP_ROOT/info.php"
cp -f /cre/db-config.php /cre/www/db-config.php

# add wasm mime.type
if grep -Fq "application/wasm" /etc/nginx/mime.types
then
  echo "mime type wasm found"
else
  echo "mime type wasm missing"
  sed -n '1,27p' /etc/nginx/mime.types > /cre/mime.types
  echo '    application/wasm                      wasm;' >> /cre/mime.types
  sed -n '28,999999p' /etc/nginx/mime.types >> /cre/mime.types
  cp -f /cre/mime.types /etc/nginx/mime.types
fi

exec "$@"
