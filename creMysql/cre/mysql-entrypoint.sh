#!/usr/bin/env bash
set -e

MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD:-"mysql"}

echo "Setting up new power user credentials."
service mysql start $ sleep 10
#/usr/bin/mysqld
#sleep 10

if mysql -h 127.0.0.1 -P 3306 --user=root --password=root -e "SELECT NOW();" ; then

  echo "Setting root new password."
  mysql -h 127.0.0.1 -P 3306 --user=root --password=root -e "UPDATE mysql.user set authentication_string=password('$MYSQL_ROOT_PWD') where user='root'; FLUSH PRIVILEGES;"

  echo "Setting root remote password."
  mysql -h 127.0.0.1 -P 3306 --user=root --password=$MYSQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

fi
# check if succeessfull
mysql -h 127.0.0.1 -P 3306 --user=root --password=$MYSQL_ROOT_PWD -e "SELECT NOW();"

#killall mysqld
service mysql stop
sleep 5
echo "Setting end,have fun."

exec "$@"
