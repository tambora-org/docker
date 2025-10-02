#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephpdevrust
#

# Pull base image.rust
FROM tamboraorg/crephp:2020.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
ENV NODE_VERSION 11.15.3
ENV RUST_VERSION 1.41.0

LABEL Name="Php Rust for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$RUST_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install nodejs
# RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
#     apt-get install -y nodejs 

# Install nodejs
RUN \
  apt-get update && \
  apt-get install -y nodejs npm  ## npm not included in nodejs

# Install rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="~/.cargo/bin:${PATH}"

# Install rust wasm-pack
RUN /bin/bash -c "source ~/.cargo/env && curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh"
# or
##RUN npm install -g wasm-pack

#RUN git clone https://github.com/ruffle-rs/ruffle.git && ls -l ~ && ls -l ~/ruffle
RUN git clone https://github.com/ruffle-rs/ruffle.git ~/ruffle && ls -l ~/ruffle


#RUN ls -l ~/ruffle
RUN /bin/bash -c "source ~/.cargo/env && cd ~/ruffle/web &&  npm run bootstrap && npm run build"

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creRust \t $(~/.cargo/bin/rustc --version)" >> /cre/versions.txt 

COPY cre /cre

VOLUME ["/cre/www"]
WORKDIR "/cre/www"
