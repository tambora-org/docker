#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephpdevrust
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
ENV RUST_VERSION 99.99

LABEL Name="Php Rust for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$RUST_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs 

# Install rust
##RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
#RUN $HOME/.cargo/env
#RUN . $HOME/.cargo/env

##RUN snap install rustup --edge --classic

RUN ls -l /root/.cargo/bin
#RUN /bin/bash -c "source ~/.cargo/env" && rustc --version
RUN /root/.cargo/bin/rustc --version

# Install rust wasm-pack
#RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
RUN /bin/bash -c "source /root/.cargo/env" && \
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
# or
RUN npm install -g wasm-pack

RUN git clone https://github.com/ruffle-rs/ruffle.git
RUN cd web/selfhosted &&  npm install && npm run build

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creRust \t $(/root/.cargo/bin/rustc --version)" >> /cre/versions.txt 

COPY cre /cre

VOLUME ["/cre/www"]
WORKDIR "/cre/www"
