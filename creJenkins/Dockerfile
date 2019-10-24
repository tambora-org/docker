#
# Jenkins Dockerfile
#
# https://github.com/tamboraorg/docker/crejenkins
#

# Pull base image. 
FROM tamboraorg/crejava:2012.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV JENKINS_VERSION 0

LABEL Name="Jenkins for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$JENKINS_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add - && \
    echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list

# Install jenkins, java-jdk & ant
RUN apt-get update && \
    apt-get install --no-install-recommends -y openjdk-$JAVA_VERSION-jdk jenkins ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    update-rc.d -f jenkins disable 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs 

# Install yarn & npm
## Ubuntu 17 maybe needs: apt remove cmdtest 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ rc main" | tee /etc/apt/sources.list.d/yarn.list 
RUN apt-get update && apt-get install yarn && apt-get clean
#RUN apt-get update && apt-get install npm nodejs-legacy && apt-get clean


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  jdk \t $(javac -version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t creJenkins \t $(java -jar /usr/share/jenkins/jenkins.war --version)" >> /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  ant \t $(ant -version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  node \t $(node --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  yarn \t $(yarn --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

ENV JENKINS_HOME /var/jenkins

COPY cre /cre
WORKDIR /cre/

EXPOSE 8080 50000

# ENTRY-POINT /cre/start-jenkins.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]
CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--argumentsRealm.passwd.jenkins=swordfish", "--argumentsRealm.roles.jenkins=admin"]

# CMD ["/usr/bin/java", "-version"]
