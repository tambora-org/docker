#
# Spring Dockerfile
#
# https://github.com/tamboraorg/docker/crespring
#

# Pull base image. 
FROM tamboraorg/crejava:latest

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
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

# unpack maven zip into folder /cre/code
# ./mvnw spring-boot:run


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  jdk \t $(javac -version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t maven \t $(mvn -version)" >> /cre/versions.txt 



#ENV JENKINS_HOME /var/jenkins

COPY cre /cre
WORKDIR /cre/

#later move to entry-point - only init if not yet done.
#RUN unzip /cre/maven-spring-boot.zip -d /cre/spring
#RUN mv /cre/spring/app/src/main/java/com/example /cre/spring/app/src/main/java/com/cre
RUN cp -R /cre/maven-spring-boot /cre/spring/app
RUN cp /cre/DemoApplication.java /cre/spring/app/src/main/java/com/cre/demo/DemoApplication.java

WORKDIR /cre/spring/app

EXPOSE 8080 

# ENTRY-POINT /cre/start-kafka.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

CMD ["./mvnw", "spring-boot:run"]

 
