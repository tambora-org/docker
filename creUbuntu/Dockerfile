#
# Ubuntu Dockerfile
#
# https://github.com/tamboraorg/docker/creUbuntu
# (adapted from https://github.com/dockerfile/ubuntu )

# Pull base image.
FROM ubuntu:16.04
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

# version: yyyy.n for stable versions / 0.yyyy for development
ENV CRE_VERSION 0.2010 
ENV UBUNTU_VERSION 16.04
ENV DOCKER_GEN_VERSION 0.7.4
ENV DOCKER_HOST unix:///tmp/docker.sock

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y apt-transport-https build-essential inotify-tools locales software-properties-common && \
  apt-get install -y byobu curl git htop libzip4  logrotate man pwgen sudo unzip vim wget && \
  apt-get install -y libssh2-1 openssl openssh-server openssh-client && \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US en_US.UTF-8 && \ 
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts
#? ssh-server:  /etc/ssh/sshd_config 

# Install docker-gen (generates files from templates with docker data filled in)
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creUbuntu \t $(cat /usr/lib/os-release | grep PRETTY | sed -e "s/^PRETTY_NAME=\"Ubuntu //" -e "s/\"$//")" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  $(openssl version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  docker-gen \t $(docker-gen -version)" >> /cre/versions.txt

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

