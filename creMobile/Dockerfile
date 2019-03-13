# See https://vue-native.io/getting-started.html 
FROM tamboraorg/credevvue:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV MOBILE_VERSION 0.0

LABEL Name="Mobile for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$MOBILE_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install nodejs
##RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
##    apt-get install -y nodejs 
#RUN apt-get update && apt-get install npm && apt-get clean ## included in nodejs

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t creMobile \t ${MOBILE_VERSION}" >> /cre/versions.txt  


COPY cre /cre

##VOLUME ["/cre/vue-components" "/cre/web-components"]
WORKDIR "/cre/dev"

ENTRYPOINT ["/cre/mobile-entrypoint.sh"]

# Open up fcgi port 
#EXPOSE 8080

CMD ["shoreman", "/cre/mobile-procfile"]
