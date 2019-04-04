# Adapted from 
FROM tamboraorg/crenode:2011.0
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

COPY cre /cre

##VOLUME ["/cre/vue-components" "/cre/web-components"]

RUN npm set init.version "${CRE_VERSION}.0" 
RUN npm set init.license "Apache-2.0" 
# npm set init.author.email "example-user@example.com" 
# npm set init.author.name "example_user" 
# npm config set init.author.url http://iamsim.me/ 
# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory 


RUN npm install -g typescript ajv webpack 
#RUN npm install -g core-js@3 #or 2
RUN npm install -g npm-add-script  
RUN npm install -g vue-template-compiler @vue/cli @vue/cli-service    
RUN npm install -g --save-dev @vue/cli-plugin-babel @vue/cli-plugin-eslint
#RUN npm install --save-dev @babel/preset-env ## compatibility / useBuiltIns 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t creVue \t ${VUE_VERSION}" >> /cre/versions.txt  && \
    echo "$(date +'%F %R') \t  vue \t $(vue --version)" >> /cre/versions.txt && \
    echo "$(date +'%F %R') \t  typescript \t $(tsc -v)" >> /cre/versions.txt 

## FROM entrypoint
RUN mkdir -p /cre/dev/cre-components
RUN cd /cre/dev

RUN vue create -d -f cre-components
RUN cd /cre/dev/cre-components
##RUN npm version "${CRE_VERSION}.0"  ## DOES NOT WORK
RUN npm install --save vue vuex
RUN npm install --save-dev @vue/web-component-wrapper 
RUN npm install --save-dev @babel/plugin-transform-runtime
RUN npm install --save @babel/runtime
RUN npm install --save es6-promise   # vuex
RUN npm install --save core-js@2
#RUN npm install --save babel-polyfill
RUN npm-install-peers
##
WORKDIR "/cre/dev/cre-components"

ENTRYPOINT ["/cre/vue-entrypoint.sh"]

# Open up fcgi port 
EXPOSE 8080

CMD ["shoreman", "/cre/vue-procfile"]
