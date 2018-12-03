# Python Dockerfile 
#
# https://github.com/tamboraorg/docker/crepython
#

# Pull base image.
FROM tamboraorg/creubuntu:2010.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

# version: yyyy.n for stable versions / 0.yyyy for development
ENV DEBIAN_FRONTEND noninteractive 
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV PYTHON_VERSION 999999 

RUN apt-get update && apt-get -y --no-install-recommends install python3 python3-setuptools python3-pip npm nodejs-legacy && apt-get clean 

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t crePYTHON \t $PYTHON_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t Python3 \t $(python3 --version)" >> /cre/versions.txt && \  
   echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

#COPY cre /cre
WORKDIR /cre/

#EXPOSE 8000

CMD ["sleep 1000000"]
