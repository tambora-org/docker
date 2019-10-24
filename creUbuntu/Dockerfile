#
# Ubuntu Dockerfile
#
# https://github.com/tamboraorg/docker/creUbuntu
# (adapted from https://github.com/dockerfile/ubuntu )

# Pull base image.
FROM ubuntu:18.04
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# version: yyyy.n for stable versions 
#          0.yyyy for development - tagged automatically if base functionality is working 
ENV CRE_VERSION 0.2012 
ENV UBUNTU_VERSION 18.04
ENV OPENSSL_VERSION 1.0.2g

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ=UTC
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

LABEL Name="Ubuntu for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$UBUNTU_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install.
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y apt-transport-https build-essential g++ inotify-tools locales libc-dev make software-properties-common expect && \
  apt-get install -y bc byobu curl git htop libzip4 zlib1g logrotate man pwgen sudo rsync unzip vim wget && \
  apt-get install -y libssh2-1 openssl openssh-server openssh-client ufw && \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US en_US.UTF-8 && \ 
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creUbuntu \t $(cat /usr/lib/os-release | grep PRETTY | sed -e "s/^PRETTY_NAME=\"Ubuntu //" -e "s/\"$//")" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  $(openssl version)" >> /cre/versions.txt 

COPY cre/ /cre/
# Copy shoremen to handle Procfile (Process Managment)
COPY /cre/shoreman.sh /usr/local/bin/shoreman
RUN chmod 755 /usr/local/bin/shoreman

# Set environment variables.
ENV HOME /cre

# Define working directory.
WORKDIR /cre

ENTRYPOINT ["/cre/ubuntu-entrypoint.sh"]
CMD ["shoreman", "/cre/ubuntu-procfile"]

