#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephpdev
#

# Pull base image.rust
FROM tamboraorg/crephp:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
ENV NODE_VERSION 11.15.3

LABEL Name="Php Rust for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PHP_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs 

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rust wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
# or
npm install -g wasm-pack

COPY cre /cre

VOLUME ["/cre/www"]
WORKDIR "/cre/www"
