# Adapted from 
FROM tamboraorg/crenode:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV NODE_PACKAGE_VERSION 2012.0 

LABEL Name="Node Pakages for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$NODE_PACKAGE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 


RUN npm install -g jquery
RUN npm install -g vue
RUN npm install -g leaflet
RUN npm install -g ol
RUN npm install -g d3
#RUN npm install -g 

RUN npm-install-peers


RUN npm set init.version "${CRE_VERSION}.0"
RUN v "${CRE_VERSION}.0"
RUN npm set init.license "Apache-2.0"
# npm set init.author.email "example-user@example.com" 
# npm set init.author.name "example_user" 
# npm config set init.author.url http://iamsim.me/ 


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creNodePackages \t ${NODE_PACKAGE_VERSION}" >> /cre/versions.txt  && \
    echo "$(date +'%F %R') \t  node \t $(node --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

COPY cre /cre

WORKDIR "/cre/node/packages"

ENTRYPOINT ["/cre/node-packages-entrypoint.sh"]

CMD ["shoreman", "/cre/node-packages-procfile"]
