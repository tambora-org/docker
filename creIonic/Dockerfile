# See https://vue-native.io/getting-started.html 
FROM tamboraorg/credevvue:latest
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MOBILE_VERSION 0.0

LABEL Name="Mobile App for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MOBILE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# https://medium.com/@aguidrevitch/when-installation-of-global-package-using-npm-inside-docker-fails-b551b5dda389
# Dockerfile sometimes run npm as nobody.
ENV NPM_CONFIG_PREFIX=/cre/node/.npm-global
ENV PATH=$PATH:/cre/node/.npm-global/bin
RUN mkdir -p /cre/node/.npm-global
RUN npm -g config set user root 

#RUN npm install -g @ionic/cli cordova-res
RUN npm install -g ionic 
RUN npm install -g @ionic/vue 
RUN npm install -g @ionic/vue-router

#npm-install-peers

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creMobile \t ${MOBILE_VERSION}" >> /cre/versions.txt 

COPY cre /cre

##VOLUME ["/cre/vue-components" "/cre/web-components"]

ENTRYPOINT ["/cre/ionic-entrypoint.sh"]

WORKDIR "/cre/dev/cre-app"

# Open up fcgi port 
#EXPOSE 8080
EXPOSE 19001
EXPOSE 19002

CMD ["shoreman", "/cre/ionic-procfile"]
