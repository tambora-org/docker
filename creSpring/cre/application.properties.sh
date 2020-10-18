#!/bin/sh 

sleep 0.25

if [ /cre/application-pgs.properties -nt /cre/spring/app/src/main/resources/application-pgs.properties ]
then
   echo "Now copy latest application-pgs.properties to /cre/spring/app/src/main/resources"
   cp -f /cre/application-pgs.properties /cre/spring/app/src/main/resources/application-pgs.properties
fi

if [ /cre/application-mail.properties -nt /cre/spring/app/src/main/resources/application-mail.properties ]
then
   echo "Now copy latest application-mail.properties to /cre/spring/app/src/main/resources"
   cp -f /cre/application-mail.properties /cre/spring/app/src/main/resources/application-mail.properties
fi

if [ /cre/application.properties -nt /cre/spring/app/src/main/resources/application.properties ]
then
   echo "Now copy latest application.properties to /cre/spring/app/src/main/resources"
   cp -f /cre/application.properties /cre/spring/app/src/main/resources/application.properties
fi



