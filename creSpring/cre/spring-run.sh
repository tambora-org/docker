#!/bin/sh 

cp -R -f /cre/maven-spring-boot /cre/spring/app
##RUN mv /cre/maven-spring-boot /cre/spring/app
cp -f /cre/DemoApplication.java /cre/spring/app/src/main/java/com/cre/demo/DemoApplication.java


sleep 2.25 
/cre/spring/app/mvnw spring-boot:run 


