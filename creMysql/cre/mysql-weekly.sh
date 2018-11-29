#!/bin/bash 
export TERM=xterm  
echo "Mysql weekly"

mysql -N -h 127.0.0.1 -P 3306 --user=root --password=$MYSQL_ROOT_PWD -e 'show databases' | \
 grep -v 'mysql\|information_schema\|performance_schema' | \
 while read -r db; do
   echo "Existing databases: $db"
 done 
