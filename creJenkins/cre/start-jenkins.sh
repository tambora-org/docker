#!/bin/sh 

/usr/bin/java -jar /usr/share/jenkins/jenkins.war --argumentsRealm.passwd.jenkins=swordfish --argumentsRealm.roles.jenkins=admin &
#/usr/bin/java -jar /var/jenkins/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080 install-plugin ant --username jenkins --password swordfish

#run the CMD part now
exec "$@"
