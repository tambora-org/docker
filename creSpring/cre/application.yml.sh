#!/bin/sh 

sleep 0.25

if [ /cre/application-pgs.yml -nt /cre/spring/app/src/main/resources/application-pgs.yml ]
then
   echo "Now copy latest application-pgs.yml to /cre/spring/app/src/main/resources"
   cp -f /cre/application-pgs.yml /cre/spring/app/src/main/resources/application-pgs.yml
fi

#if [ /cre/application-mail.yml -nt /cre/spring/app/src/main/resources/application-mail.yml ]
#then
#   echo "Now copy latest application-mail.yml to /cre/spring/app/src/main/resources"
#   cp -f /cre/application-mail.yml /cre/spring/app/src/main/resources/application-mail.yml
#fi

if [ /cre/application.yml -nt /cre/spring/app/src/main/resources/application.yml ]
then
   echo "Now copy latest application.yml to /cre/spring/app/src/main/resources"
   cp -f /cre/application.yml /cre/spring/app/src/main/resources/application.yml
fi

if [ /cre/pom.xml -nt /cre/spring/app/pom.xml ]
then
   echo "Now copy latest pom.xml to /cre/spring/app"
   cp -f /cre/pom.xml /cre/spring/app/pom.xml
fi



