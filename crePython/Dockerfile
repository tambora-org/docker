# Python Dockerfile 
#
# https://github.com/tamboraorg/docker/crepython
#

# Pull base image.
FROM tamboraorg/creubuntu:2012.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# version: yyyy.n for stable versions / 0.yyyy for development
ENV DEBIAN_FRONTEND noninteractive 
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV NPM_VERSION 6
ENV PYTHON_VERSION 999999 

LABEL Name="Python for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PYTHON_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# npm >= 6 needed
#RUN apt-get update && apt-get -y --no-install-recommends install npm nodejs-legacy && apt-get clean 
RUN curl -sL https://deb.nodesource.com/setup_$NPM_VERSION.x | sudo -E bash - && \
   apt-get install -y --no-install-recommends nodejs 

RUN apt-get update && apt-get -y --no-install-recommends install python3 python3-setuptools python3-pip python3-plotly && apt-get clean 

RUN pip3 install --upgrade pip setuptools wheel

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t crePYTHON \t $PYTHON_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t Python3 \t $(python3 --version)" >> /cre/versions.txt && \  
   echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

#COPY cre /cre
WORKDIR /cre/

#EXPOSE 8000

CMD ["sleep 1000000"]
