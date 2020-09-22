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
ENV TENSORFLOW_VERSION 1.14.0 

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
RUN pip3 install tensorboard tensorboard_logger


# https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz
# https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-2.3.0.tar.gz

RUN curl https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-$TENSORFLOW_VERSION.tar.gz > /cre/libtensorflow-linux-x86_64.tar.gz && \
    tar -C /usr/local -xzf /cre/libtensorflow-linux-x86_64.tar.gz && \
    rm -f /cre/libtensorflow-linux-x86_64.tar.gz
RUN ldconfig


## Install AutoML sklearn
#
## Requirements
#pytest>=4.6
#*#Cython
#scikit-learn>=0.22.0,<0.23
#lockfile
#joblib
#pyyaml
#liac-arff
#*#ConfigSpace>=0.4.0,<0.5
#pynisher>=0.4.2
#pyrfr>=0.7,<0.9
#smac>=0.12
#
#DONE#setuptools
#DONE#psutil
#DONE#numpy>=1.9.0
#DONE#scipy>=0.14.1
#DONE#pandas<1.0
#
RUN curl https://raw.githubusercontent.com/automl/auto-sklearn/master/requirements.txt | xargs -n 1 -L 1 pip3 install
RUN pip3 install auto-sklearn

## PyTorch:  https://pytorch.org
RUN pip3 install torch torchvision
# https://github.com/PyTorchLightning/pytorch-lightning
RUN pip3 install pytorch-lightning

## Install AutoML PyTorch
## Requirements
#netifaces
#statsmodels
#imblearn
#hpbandster
#fasteners
#torch
#torchvision
#tensorboard_logger
#openml
#lightgbm
#catboost
##

RUN curl https://raw.githubusercontent.com/automl/Auto-PyTorch/master/requirements.txt | xargs -n 1 -L 1 pip3 install
RUN mkdir -p /cre && cd /cre && git clone https://github.com/automl/Auto-PyTorch.git && cd Auto-PyTorch && python3 setup.py install && cd /cre 

# AutoKeras
# https://machinelearningmastery.com/autokeras-for-classification-and-regression/
RUN pip3 install autokeras

# Add stanza 
# https://stanfordnlp.github.io/stanza/
# https://github.com/stanfordnlp/stanza
RUN pip3 install stanza

#https://caffe.berkeleyvision.org/install_apt.html
#https://caffe.berkeleyvision.org/
RUN apt-get -y --no-install-recommends install caffe-cpu
#RUN apt-get -y --no-install-recommends install caffe-cuda


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creTensorflow \t $TENSORFLOW_VERSION" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  torch \t $(python3 -c 'import torch; print(torch.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t  $(pip3 list | grep 'tensorflow ')" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  sklearn \t $(python3 -c 'import sklearn; print(sklearn.__version__)')" >> /cre/versions.txt




#COPY cre /cre


#EXPOSE 8000

CMD ["/usr/bin/sleep", "1000000"]
