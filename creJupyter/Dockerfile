# https://jupyterhub.readthedocs.io/en/stable/quickstart.html#prerequisites
# https://jupyter.readthedocs.io/en/latest/install.html
# https://jupyterhub.readthedocs.io/en/stable/reference/config-proxy.html
#
# https://github.com/jupyter/jupyter/wiki/Jupyter-kernels
#
# https://github.com/fredokun/cl-jupyter
# https://github.com/fredokun/cl-jupyter/blob/master/about-cl-jupyter.ipynb
#
# https://irkernel.github.io/
# https://github.com/quantopian/pgcontents  ##postgres
#
# https://jupyterlab.readthedocs.io/en/stable/user/jupyterhub.html
# https://nbconvert.readthedocs.io/en/latest/install.html#installing-nbconvert

# Jupyter Hub Dockerfile 
#
# https://github.com/tamboraorg/docker/crepython
#

# Pull base image.
FROM tamboraorg/cretensorflow:2012.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# version: yyyy.n for stable versions / 0.yyyy for development
#ENV DEBIAN_FRONTEND noninteractive 
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV JUPYTER_VERSION 999999 

# Install Jupyter Notebook first
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
## RUN pip3 install jupyterlab # try jupyterlab
# Install Jupyter Hub second
RUN python3 -m pip install jupyterhub
RUN npm install -g configurable-http-proxy
RUN python3 -m pip install notebook  # needed if running the notebook servers locally
#RUN jupyter labextension install @jupyterlab/hub-extension  # try jupyterlab

# check??
#jupyterhub -h
#configurable-http-proxy -h

#Install Lisp: sbcl
RUN wget http://prdownloads.sourceforge.net/sbcl/sbcl-1.2.9-x86-64-linux-binary.tar.bz2 -O /cre/sbcl.tar.bz2 && \
    mkdir /cre/sbcl && \
    tar -jxvf /cre/sbcl.tar.bz2 --strip-components=1 -C /cre/sbcl/ && \
    cd /cre/sbcl && \
    sh ./install.sh && \
    cd /cre && \
    rm -rf /cre/sbcl/

# quicklisp
RUN wget http://beta.quicklisp.org/quicklisp.lisp -O /cre/quicklisp.lisp
#ADD install.lisp /cre/install.lisp
#RUN sbcl --non-interactive --load /cre/install.lisp
RUN sbcl --non-interactive --load /cre/quicklisp.lisp
# curl -O https://beta.quicklisp.org/quicklisp.lisp
# curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
# gpg --verify quicklisp.lisp.asc quicklisp.lisp

RUN mkdir /cre/cl && \ 
   wget https://github.com/fredokun/cl-jupyter/archive/master.zip -O /cre/cl-jupyter.zip && \
   unzip /cre/cl-jupyter.zip -d /cre/cl && \
   cd /cre/cl/cl-jupyter-master && \
   python3 ./install-cl-jupyter.py
    


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t creJupyter \t $JUPYTER_VERSION" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/

EXPOSE 8000

ENTRYPOINT ["/cre/jupyter-entrypoint.sh"]
CMD ["shoreman", "/cre/jupyter-procfile"]
