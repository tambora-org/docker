# See https://vue-native.io/getting-started.html 
FROM tamboraorg/credevvue:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MOBILE_VERSION 0.0

LABEL Name="Mobile App for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MOBILE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# https://medium.com/@aguidrevitch/when-installation-of-global-package-using-npm-inside-docker-fails-b551b5dda389
# Dockerfile sometimes run npm as nobody.
ENV NPM_CONFIG_PREFIX=/cre/node/.npm-global
ENV PATH=$PATH:/cre/node/.npm-global/bin
RUN mkdir -p /cre/node/.npm-global
RUN npm -g config set user root 

RUN npm install -g --unsafe expo-cli
RUN npm install -g react 
RUN npm install -g react-native react-native-cli
## npm install nodejs-mobile-react-native --save
RUN npm install -g create-react-native-app 
RUN npm install -g vue-native-cli
## npm install -g yarn

#npm-install-peers

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creMobile \t ${MOBILE_VERSION}" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  expo \t $(expo --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  vue-native \t $(vue-native --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  react-native \t $(react-native --version  | grep react-native-cli)" >> /cre/versions.txt 

COPY cre /cre

##VOLUME ["/cre/vue-components" "/cre/web-components"]

ENTRYPOINT ["/cre/mobile-entrypoint.sh"]

WORKDIR "/cre/dev/cre-app"

# Open up fcgi port 
#EXPOSE 8080
EXPOSE 19001
EXPOSE 19002

CMD ["shoreman", "/cre/mobile-procfile"]
