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

cp -f /cre/db-test.php "/cre/$CRE_PHP_ROOT/db-test.php"
cp -f /cre/info.php "/cre/$CRE_PHP_ROOT/info.php"
cp -f /cre/db-config.php /cre/www/db-config.php

exec "$@"
