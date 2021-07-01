# Python Dockerfile 
#
# https://github.com/tamboraorg/docker/crepython
#

# Pull base image.
FROM tamboraorg/crenode:2018.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development

ENV PROCESSOR_MODE CPU   # 'GPU' or 'CPU'
ENV NVIDIA_VERSION 450

LABEL Name="Python for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PYTHON_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# install GPU driver
# https://www.linuxbabe.com/ubuntu/install-nvidia-driver-ubuntu-18-04
RUN add-apt-repository ppa:graphics-drivers/ppa
RUN apt-get  -y --no-install-recommends install ubuntu-drivers-common
RUN ubuntu-drivers devices
#RUN ubuntu-drivers autoinstall
RUN apt-get  -y --no-install-recommends install nvidia-driver-$NVIDIA_VERSION
#RUN apt-get -y --no-install-recommends install nvidia-$NVIDIA_VERSION

# install Python
RUN apt-get update && apt-get -y --no-install-recommends install python3-dev python3-plotly && apt-get clean 
##RUN apt-get update && apt-get -y --no-install-recommends install python3 python3-dev python3-setuptools python3-pip python3-plotly && apt-get clean 
##RUN pip3 install --upgrade pip 
RUN pip3 install setuptools wheel psutil pipreqs arrow
RUN pip3 install numpy scipy pandas patsy statsmodels datatable
RUN pip3 install matplotlib seaborn
RUN pip3 install Flask connexion
#RUN pip3 install pycurl  #recommended by jupyterlab

# OpenCV
RUN apt-get -y --no-install-recommends  install python3-opencv
RUN pip3 install opencv-python

# install R
# https://packages.ubuntu.com/search?suite=default&section=all&arch=any&keywords=r-cran-c&searchon=names
RUN apt-get -y --no-install-recommends install r-base r-recommended 
RUN apt-get -y --no-install-recommends install r-cran-adegraphics r-cran-amore r-cran-animation r-cran-cli  
RUN apt-get -y --no-install-recommends install r-cran-colorspace r-cran-data.table r-cran-date r-cran-devtools r-cran-foreach 
RUN apt-get -y --no-install-recommends install r-cran-formatr r-cran-formula r-cran-ggplot2 r-cran-gmaps r-cran-gnm 
RUN apt-get -y --no-install-recommends install r-cran-gsl r-cran-highr r-cran-iterators r-cran-its r-cran-jsonlite r-cran-labeling
RUN apt-get -y --no-install-recommends install r-cran-knitr r-cran-lambda.r r-cran-mapdata r-cran-mapproj r-cran-maps r-cran-maptools r-cran-markdown 
RUN apt-get -y --no-install-recommends install r-cran-mcmc r-cran-mcmcpack r-cran-mfilter r-cran-ncdf4 r-cran-nlp r-cran-openssl 
RUN apt-get -y --no-install-recommends install r-cran-pheatmap r-cran-plotly r-cran-png r-cran-prettyunits r-cran-raster r-cran-rcolorbrewer 
RUN apt-get -y --no-install-recommends install r-cran-rcpp r-cran-rcurl r-cran-rjson r-cran-rmpi
RUN apt-get -y --no-install-recommends install r-cran-rpostgresql r-cran-rsqlite r-cran-rstudioapi r-cran-scatterplot3d 
RUN apt-get -y --no-install-recommends install r-cran-sp  r-cran-spatial  r-cran-tibble
RUN apt-get -y --no-install-recommends install r-cran-tidyr r-cran-tm r-cran-utf8 r-cran-uuid r-cran-v8
RUN apt-get -y --no-install-recommends install r-cran-vcd r-cran-vcdextra r-cran-vioplot 
RUN apt-get -y --no-install-recommends install r-cran-wikidatar r-cran-wordcloud r-cran-xml r-cran-xml2 r-cran-xtable r-cran-xts 
RUN apt-get -y --no-install-recommends install r-cran-shiny r-cran-shinybs  r-cran-shinydashboard r-cran-shinyjs 

## not (yet?) available , 20.04 only 

## https://www.rplumber.io/
## https://www.r-bloggers.com/how-to-create-an-api-for-your-r-code/
#RUN apt-get -y --no-install-recommends install r-cran-plumber

## r-cran-circlize r-cran-clisymbols r-cran-commonmark r-cran-ggsci r-cran-ggthemes r-cran-jpeg r-cran-pdftools r-cran-remotes r-cran-rgdal
## r-cran-rmarkdown r-cran-rstantools r-cran-reticulate r-cran-spacetime r-cran-spatialreg r-cran-svglite r-cran-threejs
## r-cran-tidyverse r-cran-tidygraph r-cran-tidyselect r-cran-tinytex r-cran-tufte r-cran-waveslim r-cran-wavethresh r-cran-webshot r-cran-webutils 
## r-cran-shinycssloaders r-cran-shinythemes
## r-cran-mlr r-cran-mlmetrics r-cran-mlbench

## rdwd (https://cran.r-project.org/web/packages/rdwd/index.html)
## install.packages("climate")  ; climate ; (https://cran.r-project.org/web/packages/climate/index.html)

# install Latex
RUN apt-get -y --no-install-recommends install texlive-full latex-make latex2html python3-latexcodec 
 
# install cLisp ;-)
# https://packages.ubuntu.com/search?suite=default&section=all&arch=any&keywords=lisp&searchon=names
RUN apt-get -y --no-install-recommends install clisp
#sbcl
RUN apt-get -y --no-install-recommends install sbcl

# move to ubuntu later
#RUN apt-get -y --no-install-recommends install jq 

# roswell ## lisp https://github.com/roswell/roswell
##RUN apt-get -y --no-install-recommends install libcurl3
#RUN apt-get -y --no-install-recommends install libcurl4
#RUN curl --output roswell.deb -sL `curl -s https://api.github.com/repos/roswell/roswell/releases/latest | jq -r '.assets | .[] | select(.name|test("deb$")) | .browser_download_url'`
#RUN dpkg -i roswell.deb


## Julia: >=20.04
##         RUN apt-get -y --no-install-recommends install julia 
#Pkg.add("Spark.jl")
#https://stackoverflow.com/questions/51272077/install-julia-packages-via-command-line/51273146
##RUN julia -e 'using Pkg; Pkg.add("Spark.jl")'    ##ERROR
## Pkg.add(“IJulia”)

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.0-linux-x86_64.tar.gz  && \
    tar -xvzf julia-1.6.0-linux-x86_64.tar.gz  && \
    cp -r julia-1.6.0 /opt/  && \
    ln -s /opt/julia-1.6.0/bin/julia /usr/local/bin/julia  && \
    rm julia-1.6.0-linux-x86_64.tar.gz

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t crePython \t $PYTHON_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t  Python3 \t $(python3 --version)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t   numpy \t $(python3 -c 'import numpy; print(numpy.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t   scipy \t $(python3 -c 'import scipy; print(scipy.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t   pandas \t $(python3 -c 'import pandas; print(pandas.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t   openCV \t $(python3 -c 'import cv2; print(cv2.__version__)')" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t  $(R --version | grep 'R version')" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  sbcl \t $(sbcl --version)" >> /cre/versions.txt && \ 
#   echo "$(date +'%F %R') \t  $(ros --version 2>&1)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  $(julia --version)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t  $(latex --version | grep Debian)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/code   ##  ??
#WORKDIR /cre

#EXPOSE 8000

ENTRYPOINT ["/cre/python-entrypoint.sh"]
CMD ["shoreman", "/cre/python-procfile"]
