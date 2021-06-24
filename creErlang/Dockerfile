#
# Erlang Dockerfile
#
# https://github.com/tamboraorg/docker/creerlang
#

# Pull base image. 
FROM tamboraorg/creubuntu:2020.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV ERLANG_VERSION 17.0

LABEL Name="Erlang for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$ERLANG_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install Erlang

RUN wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

#20
RUN echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | tee /etc/apt/sources.list.d/erlang.list

#18
# RUN echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | tee /etc/apt/sources.list.d/erlang.list

RUN apt update -y  && apt install -y erlang
# Security packages
RUN apt install -y erlang-asn1 erlang-crypto erlang-public-key erlang-ssl 

#NOt needed yet...
## erlang-eldap erlang-ftp erlang-inets erlang-mnesia erlang-os-mon erlang-parsetools 
## erlang-runtime-tools erlang-snmp erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl

## https://www.rabbitmq.com/install-debian.html#apt

 

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t erlang \t $(erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell)" >> /cre/versions.txt 


COPY cre /cre
WORKDIR /cre/

#EXPOSE 8080 50000

# ENTRY-POINT /cre/start-erlang.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

#CMD ["/usr/bin/java", "-version"]
