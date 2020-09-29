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

RUN unzip /cre/demo_maven.zip -d /cre/spring
RUN cp /cre/DemoApplication.java /cre/spring/demo/src/main/java/com/example/demo/DemoApplication.java

WORKDIR /cre/spring/demo

EXPOSE 8080 

# ENTRY-POINT /cre/start-kafka.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

CMD ["./mvnw", "spring-boot:run"]

 
