# Tensorflow Dockerfile 
#
# https://github.com/tamboraorg/docker/cretensorflow
# 

# Pull base image.
FROM tamboraorg/crepython:2012.0

#https://www.tensorflow.org/install/lang_c
#https://www.tensorflow.org/install 

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# version: yyyy.n for stable versions / 0.yyyy for development
ENV DEBIAN_FRONTEND noninteractive 
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV TENSORFLOW_VERSION 2 

LABEL Name="Tensorflow for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$TENSORFLOW_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

WORKDIR /cre/

RUN pip3 install --upgrade pip
RUN pip3 install tensorflow

RUN curl https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz > /cre/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz && \
    tar -C /usr/local -xzf /cre/libtensorflow-cpu-linux-x86_64-1.14.0.tar.gz
RUN ldconfig

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creTensorflow \t $TENSORFLOW_VERSION" >> /cre/versions.txt 

#COPY cre /cre


#EXPOSE 8000

CMD ["sleep 1000000"]
