#!/usr/bin/env bash
set -e 

rsync -rl /cre/tmp/survey/limesurvey/ /cre/www/survey
# later use --exclude /dir1/ --exclude /dir2/
rm -rf /cre/tmp/survey
chown -R www-data:www-data /cre/www/survey
chmod -R 774 /cre/www/survey/tmp
chmod -R 774 /cre/www/survey/application/config
chmod -R 774 /cre/www/survey/upload 


if [[ -n $MYSQL_DB ]]; then
  mkdir -p /cre/www/survey/application/config 
  cp -f /cre/config-mysql.php /cre/www/survey/application/config/config.php
fi
if [[ -n $POSTGRES_DB ]]; then
  mkdir -p /cre/www/survey/application/config
  cp -f /cre/config-pgsql.php /cre/www/survey/application/config/config.php
fi

exec "$@"
