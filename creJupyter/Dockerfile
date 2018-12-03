# https://jupyterhub.readthedocs.io/en/stable/quickstart.html#prerequisites
# https://jupyter.readthedocs.io/en/latest/install.html
#
# https://github.com/jupyter/jupyter/wiki/Jupyter-kernels
#
# https://github.com/fredokun/cl-jupyter
# https://github.com/fredokun/cl-jupyter/blob/master/about-cl-jupyter.ipynb
#
# https://irkernel.github.io/

# Jupyter Hub Dockerfile 
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
ENV JUPYTER_VERSION 999999 

RUN apt-get update && apt-get -y --no-install-recommends install python3 python3-setuptools python3-pip npm nodejs-legacy && apt-get clean 

# Install Jupyter Notebook first
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
# Install Jupyter Hub second
RUN python3 -m pip install jupyterhub
RUN npm install -g configurable-http-proxy
RUN python3 -m pip install notebook  # needed if running the notebook servers locally

# check??
#jupyterhub -h
#configurable-http-proxy -h

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creJupyter \t $JUPYTER_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t Python3 \t $(python3 --version)" >> /cre/versions.txt && \  
   echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

#COPY cre /cre
WORKDIR /cre/

EXPOSE 8000

CMD ["jupyterhub"]
