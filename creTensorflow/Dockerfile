# Tensorflow Dockerfile 
#
# https://github.com/tamboraorg/docker/cretensorflow
#

# Pull base image.
FROM tamboraorg/crepython:latest

#https://www.tensorflow.org/install/lang_c
#https://www.tensorflow.org/install 

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
#ENV DEBIAN_FRONTEND noninteractive 
#ENV INITRD No
#ENV LANG en_US.UTF-8
ENV TENSORFLOW_VERSION 2 

LABEL Name="Tensorflow for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$TENSORFLOW_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

WORKDIR /cre/

RUN pip3 install --upgrade pip
RUN pip3 install tensorflow
RUN pip3 install tensorboard

RUN curl https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz > /cre/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz && \
    tar -C /usr/local -xzf /cre/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz
RUN ldconfig

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creTensorflow \t $TENSORFLOW_VERSION" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  $(pip3 list | grep 'tensorflow ')" >> /cre/versions.txt 

#COPY cre /cre


#EXPOSE 8000

CMD ["sleep 1000000"]
