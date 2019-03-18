# Adapted from 
FROM tamboraorg/creubuntu:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV VUE_VERSION 2.6.8

LABEL Name="Vue Dev for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$VUE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs 
#RUN apt-get update && apt-get install npm && apt-get clean ## included in nodejs

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creVue \t ${VUE_VERSION}" >> /cre/versions.txt  && \
    echo "$(date +'%F %R') \t  node \t $(node --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

COPY cre /cre

##VOLUME ["/cre/vue-components" "/cre/web-components"]
WORKDIR "/cre/dev"

# https://medium.com/@aguidrevitch/when-installation-of-global-package-using-npm-inside-docker-fails-b551b5dda389
# Dockerfile sometimes run npm as nobody.
RUN npm -g config set user root 

# can be used to update node
RUN npm install -g n 
RUN n stable # update node

# -g needed; https://www.npmjs.com/package/npm-add-script
RUN npm install -g typescript ajv webpack
RUN npm install -g npm-add-script  
RUN npm install -g vue-template-compiler @vue/cli @vue/cli-service    
RUN npm install -g --save-dev @vue/cli-plugin-babel @vue/cli-plugin-eslint

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t  vue \t $(vue --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  typescript \t $(tsc -v)" >> /cre/versions.txt 

ENTRYPOINT ["/cre/vue-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 8080

CMD ["shoreman", "/cre/vue-procfile"]
