#!/bin/sh 

sleep 0.25
if [ /cre/application.properties -nt /cre/spring/app/src/main/resources/application.properties ]
then
   echo "Now copy latest application.properties to /cre/www/"
   cp -f /cre/application.properties /cre/spring/app/src/main/resources/application.properties
fi



