# Adapted from 
FROM tamboraorg/creubuntu:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

#ENV DEBIAN_FRONTEND noninteractive
#ENV INITRD No
#ENV LANG en_US.UTF-8
ENV NODE_VERSION 11.15.3

LABEL Name="Node for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$NODE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs 
#RUN apt-get update && apt-get install npm && apt-get clean ## included in nodejs

# https://medium.com/@aguidrevitch/when-installation-of-global-package-using-npm-inside-docker-fails-b551b5dda389
# Dockerfile sometimes run npm as nobody.

ENV NPM_CONFIG_PREFIX=/cre/node/.npm-global
ENV PATH=$PATH:/cre/node/.npm-global/bin
RUN mkdir -p /cre/node/.npm-global
RUN npm -g config set user root 

# can be used to update node
RUN npm install -g n 
RUN n stable # update node
RUN npm install -g npm-install-peers
RUN npm install -g npm-add-script  
RUN npm install -g keywords
RUN npm install -g json
RUN npm install -g set-version
RUN npm install -g npm-get-version

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm config set init.author.url http://iamsim.me/
RUN npm set init.version "${CRE_VERSION}.0"
RUN npm set init.license "Apache-2.0"
# npm set init.author.email "example-user@example.com" 
# npm set init.author.name "example_user" 
# npm config set init.author.url http://iamsim.me/ 
# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory 


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creNode \t ${NODE_VERSION}" >> /cre/versions.txt  && \
    echo "$(date +'%F %R') \t  node \t $(node --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

COPY cre /cre

WORKDIR "/cre/node"

ENTRYPOINT ["/cre/node-entrypoint.sh"]

CMD ["shoreman", "/cre/node-procfile"]
