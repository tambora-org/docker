#!/usr/bin/env bash
set -e 

if [[ -z "${MYSQL_DB}"]]; then
  cp -f /cre/config-mysql.php /cre/www/survey/application/config/config.php
fi
if [[ -z "${POSTGRES_DB}"]]; then
  cp -f /cre/config-postgres.php /cre/www/survey/application/config/config.php
fi

exec "$@"
