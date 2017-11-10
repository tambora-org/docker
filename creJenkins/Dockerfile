#
# Jenkins Dockerfile
#
# https://github.com/tamboraorg/docker/crejenkins
#

# Pull base image. 
FROM tamboraorg/crejava

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8


#RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list

#RUN wget -qO - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add - && \
#    echo 'deb http://pkg.jenkins-ci.org/debian binary/' \
#      | tee /etc/apt/sources.list.d/jenkins.list 

RUN apt-get update 
RUN apt-get install --no-install-recommends -y jenkins 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/* 
RUN update-rc.d -f jenkins disable

ENV JENKINS_HOME /var/jenkins

EXPOSE 8080 50000

CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]