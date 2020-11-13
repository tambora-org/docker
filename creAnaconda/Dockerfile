# Anaconda Dockerfile 
#
# https://github.com/tamboraorg/docker/creanaconda
#

# Pull base image.
FROM tamboraorg/creubuntu:0.2020

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
#ENV DEBIAN_FRONTEND noninteractive 
#ENV INITRD No
#ENV LANG en_US.UTF-8
ENV ANACONDA_VERSION 3-2020.07 
ENV PROCESSOR_MODE CPU   # 'GPU' or 'CPU'
ENV NVIDIA_VERSION 450

LABEL Name="Anaconda for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$ANACONDA_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 


#https://www.anaconda.com/products/individual

## https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
## ENV SHELL ?
## bash OR sh
 
#RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O /cre/anaconda.sh && \
#    chmod +x /cre/anaconda.sh && \
#    bash /cre/anaconda.sh -b
#RUN /cre/anaconda3/bin/conda init bash
#RUN /cre/anaconda3/bin/conda update -n base -c defaults conda


RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    /opt/conda/bin/conda clean -afy



## /cre/anaconda3/bin/conda

#
RUN mkdir /cre/anaconda && \
    /bin/bash "/usr/bin/python3 /opt/conda/bin/conda create -n eda python=3.6" && \
    /bin/bash "/usr/bin/python3 /opt/conda/bin/conda activate eda" && \
    pip3 install --upgrade pip && \
    pip3 install -r /cre/requirements.txt

# 
##RUN pip3 install --upgrade pip
##RUN pip3 install xxx



RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creAnaconda \t $ANACONDA_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t  Python3 \t $(python3 --version)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t   numpy \t $(python3 -c 'import numpy; print(numpy.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t   scipy \t $(python3 -c 'import scipy; print(scipy.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t   pandas \t $(python3 -c 'import pandas; print(pandas.__version__)')" >> /cre/versions.txt 


#COPY cre /cre
WORKDIR /cre/anaconda

#EXPOSE 8888

# RUN jupyter notebook

CMD ["/usr/bin/sleep", "1000000"]
