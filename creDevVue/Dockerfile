# Adapted from 
FROM tamboraorg/crenode:2012.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

#ENV DEBIAN_FRONTEND noninteractive
#ENV INITRD No
ENV VUE_VERSION 2.6.8

LABEL Name="Vue Dev for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$VUE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

COPY cre /cre

#move to ubuntu if working
RUN apt-get update && apt-get install util-linux rename && apt-get clean  

##VOLUME ["/cre/vue-components" "/cre/web-components"]

RUN npm install -g typescript ajv webpack && \
    npm install -g vue-template-compiler @vue/cli @vue/cli-service && \    
    npm install -g --save-dev @vue/cli-plugin-babel @vue/cli-plugin-eslint
#RUN npm install --save-dev @babel/preset-env ## compatibility / useBuiltIns 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creVue \t ${VUE_VERSION}" >> /cre/versions.txt  && \
    echo "$(date +'%F %R') \t  vue \t $(vue --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  typescript \t $(tsc -v)" >> /cre/versions.txt 

## FROM entrypoint
RUN mkdir -p /cre/node/wc-template && \
    cd /cre/node && \
    vue create -d -f wc-template
RUN cp /cre/node/vue-common/install.sh /cre/node/wc-template/
RUN cp /cre/node/vue-common/.eslintrc.js /cre/node/wc-template/
RUN cp /cre/node/vue-common/vue.config.js /cre/node/wc-template/

RUN mkdir -p /cre/node/js-template/src && \
    cd /cre/node/js-template && \
    npm init -yes
RUN echo "#!/usr/bin/env bash'" >> /cre/node/js-template/install.sh && \
    echo "echo 'Install further node components for js build'" > /cre/node/js-template/install.sh && \
    chmod 775 /cre/node/js-template/install.sh

## Add temporary build directories 
RUN mkdir -p /cre/node/cre-components
RUN mkdir -p /cre/node/js-components

WORKDIR "/cre/node/wc-template"
  
RUN cd /cre/node/wc-template  && \ 
    npm install --save vue vuex axios vue-resource && \ 
    npm install --save ucid  && \ 
    npm install --save-dev @vue/web-component-wrapper  && \ 
    npm install --save-dev @babel/plugin-transform-runtime  && \ 
    npm install --save @babel/runtime   
RUN npm install --save es6-promise   # vuex
RUN npm install --save core-js@2 # needs version 2 for now (instead of 3)
#RUN npm install --save babel-polyfill
RUN npm install --save c4u-glue w4u-io
RUN npm-install-peers
RUN v "${CRE_VERSION}.0"
##

ENTRYPOINT ["/cre/vue-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 8080

CMD ["shoreman", "/cre/vue-procfile"]
