#!/bin/sh 

echo "Initialize spring-boot to /cre/spring/app"
cp -R -T -f /cre/maven-spring-boot /cre/spring/app
cp -f /cre/DemoApplication.java /cre/spring/app/src/main/java/com/cre/demo/DemoApplication.java

sleep 2.25 
echo "Now run spring"
/cre/spring/app/mvnw spring-boot:run 


