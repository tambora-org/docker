#!/usr/bin/env bash
set -e 

rsync -rl /cre/tmp/survey/ /cre/www/survey
# later use --exclude /dir1/ --exclude /dir2/
rm -rf /cre/tmp/survey

if [[ -n $MYSQL_DB ]]; then
  mkdir -p /cre/www/survey/application/config 
  cp -f /cre/config-mysql.php /cre/www/survey/application/config/config.php
fi
if [[ -n $POSTGRES_DB ]]; then
  mkdir -p /cre/www/survey/application/config
  cp -f /cre/config-pgsql.php /cre/www/survey/application/config/config.php
fi

exec "$@"
