#!/bin/sh 

sleep 0.25
if [ /cre/db-config.php -nt /cre/www/db-config.php ]
then
   echo "Now copy latest db-config.php to /cre/www/"
   cp -f /cre/db-config.php /cre/www/db-config.php
fi
