#
# Spring Dockerfile
#
# https://github.com/tamboraorg/docker/crespring
#

# Pull base image. 
FROM tamboraorg/creubuntu:2020.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV SPRING_VERSION 2.3.3

LABEL Name="Spring for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$SPRING_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/
RUN apt update -y && apt install -y maven


#https://spring.io/guides

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t maven \t $(mvn -version)" >> /cre/versions.txt 

#ENV JENKINS_HOME /var/jenkins

COPY cre /cre
WORKDIR /cre/

#later move to entry-point - only init if not yet done.
#RUN unzip /cre/maven-spring-boot.zip -d /cre/spring
#RUN mv /cre/spring/app/src/main/java/com/example /cre/spring/app/src/main/java/com/cre
RUN mkdir -p /cre/spring
#RUN cp -R /cre/maven-spring-boot /cre/spring/app
##RUN mv /cre/maven-spring-boot /cre/spring/app
##RUN cp /cre/DemoApplication.java /cre/spring/app/src/main/java/com/cre/demo/DemoApplication.java

#COPY cre/maven-spring-boot /cre/spring/app
#COPY cre/DemoApplication.java /cre/spring/app/src/main/java/com/cre/demo/DemoApplication.java
#RUN cd /cre/maven-spring-boot &&  mvn -N io.takari:maven:wrapper 
RUN cd /cre/maven-spring-boot && ./mvnw clean install

#  mvn install -DskipTests


WORKDIR /cre/spring/app

EXPOSE 8080 

# Define default command.
ENTRYPOINT ["/cre/spring-entrypoint.sh"]
CMD ["shoreman", "/cre/spring-procfile"]

 
