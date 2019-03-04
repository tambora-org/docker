#!/bin/sh 

sleep 0.25
if [ /cre/db-config.php -nt /cre/www/db-config.php ]
then
   cp -f /cre/db-config.php /cre/www/db-config.php
fi
