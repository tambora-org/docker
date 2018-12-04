#!/usr/bin/env bash
set -e 

if [[ -n $MYSQL_DB ]]; then
  mkdir -p /cre/www/survey/application/config 
  cp -f /cre/config-mysql.php /cre/www/survey/application/config/config.php
fi
if [[ -n $POSTGRES_DB ]]; then
  mkdir -p /cre/www/survey/application/config
  cp -f /cre/config-pgsql.php /cre/www/survey/application/config/config.php
fi

exec "$@"
