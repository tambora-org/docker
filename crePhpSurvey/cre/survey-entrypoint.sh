#!/usr/bin/env bash
set -e 

if [[ -n $MYSQL_DB ]]; then
  cp -f /cre/config-mysql.php /cre/www/survey/application/config/config.php
fi
if [[ -n $POSTGRES_DB ]]; then
  cp -f /cre/config-postgres.php /cre/www/survey/application/config/config.php
fi

exec "$@"
