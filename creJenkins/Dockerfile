#
# Jenkins Dockerfile
#
# https://github.com/tamboraorg/docker/crejenkins
#

# Pull base image. 
FROM tamboraorg/crejava:2010.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

# version: yyyy.n for stable versions / 0.yyyy for development
ENV CRE_VERSION 0.2010 
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

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
RUN apt-get update && apt-get install npm && apt-get clean


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creJenkins \t $(java -jar /usr/share/jenkins/jenkins.war --version)" >> /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t  ant \t $(ant -version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  node \t $(node --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  yarn \t $(yarn --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

ENV JENKINS_HOME /var/jenkins

COPY cre /cre

EXPOSE 8080 50000

# ENTRY-POINT /cre/start-jenkins.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]
CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--argumentsRealm.passwd.jenkins=swordfish", "--argumentsRealm.roles.jenkins=admin"]

# CMD ["/usr/bin/java", "-version"]