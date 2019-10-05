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

# install Python
RUN apt-get update && apt-get -y --no-install-recommends install python3 python3-setuptools python3-pip python3-plotly && apt-get clean 
RUN pip3 install --upgrade pip setuptools wheel

# install R
# https://packages.ubuntu.com/search?suite=default&section=all&arch=any&keywords=r-cran-c&searchon=names
RUN apt-get -y --no-install-recommends install r-base r-recommended 
RUN apt-get -y --no-install-recommends install r-cran-adegraphics r-cran-amore r-cran-animation r-cran-cli  
RUN apt-get -y --no-install-recommends install r-cran-colorspace r-cran-data.table r-cran-date r-cran-devtools r-cran-foreach 
RUN apt-get -y --no-install-recommends install r-cran-formatr r-cran-formula r-cran-ggplot2 r-cran-gmaps r-cran-gnm 
RUN apt-get -y --no-install-recommends install r-cran-gsl r-cran-highr r-cran-iterators r-cran-its r-cran-jsonlite r-cran-labeling
RUN apt-get -y --no-install-recommends install r-cran-knitr r-cran-lambda.r r-cran-mapdata r-cran-mapproj r-cran-maps r-cran-maptools r-cran-markdown 
RUN apt-get -y --no-install-recommends install r-cran-mcmc r-cran-mcmcpack r-cran-mfilter r-cran-ncdf4 r-cran-nlp r-cran-openssl r-cran-pdftools
RUN apt-get -y --no-install-recommends install r-cran-pheatmap r-cran-plotly r-cran-png r-cran-prettyunits r-cran-raster r-cran-rcolorbrewer 
RUN apt-get -y --no-install-recommends install r-cran-rcpp r-cran-rcurl  r-cran-remotes r-cran-rgdal r-cran-rjson r-cran-rmarkdown r-cran-rmpi
RUN apt-get -y --no-install-recommends install r-cran-rpostgresql r-cran-rsqlite r-cran-rstantools r-cran-rstudioapi r-cran-reticulate r-cran-scatterplot3d 
RUN apt-get -y --no-install-recommends install r-cran-sp r-cran-spacetime r-cran-spatial r-cran-spatialreg r-cran-svglite r-cran-threejs r-cran-tibble
RUN apt-get -y --no-install-recommends install r-cran-tidyr r-cran-tidyverse r-cran-tinytex r-cran-tm r-cran-tufte r-cran-utf8 r-cran-uuid r-cran-v8
RUN apt-get -y --no-install-recommends install r-cran-vcd r-cran-vcdextra r-cran-vioplot r-cran-waveslim r-cran-wavethresh r-cran-webshot r-cran-webutils
RUN apt-get -y --no-install-recommends install r-cran-wikidatar r-cran-wordcloud r-cran-xml r-cran-xml2 r-cran-xtable r-cran-xts 

RUN apt-get -y --no-install-recommends install r-cran-shiny r-cran-shinybs r-cran-shinycssloaders r-cran-shinydashboard r-cran-shinyjs r-cran-shinythemes

# not (yet?) available
## r-cran-circlize r-cran-clisymbols r-cran-commonmark r-cran-ggsci r-cran-ggthemes r-cran-jpeg

# install Latex
RUN apt-get -y --no-install-recommends install texlive-full latex-make latex2html python3-latexcodec 
 
# install cLisp ;-)
# https://packages.ubuntu.com/search?suite=default&section=all&arch=any&keywords=lisp&searchon=names
RUN apt-get -y --no-install-recommends install clisp
 

RUN mkdir -p /cre && touch /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t crePYTHON \t $PYTHON_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t Python3 \t $(python3 --version)" >> /cre/versions.txt && \  
   echo "$(date +'%F %R') \t  npm \t $(npm --version)" >> /cre/versions.txt 

#COPY cre /cre
WORKDIR /cre/

#EXPOSE 8000

CMD ["sleep 1000000"]
