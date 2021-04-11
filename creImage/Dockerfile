#
# Images RabbitMQ Dockerfile
#

FROM tamboraorg/creubuntu:2020.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

ENV XXX_VERSION 1.0.0

LABEL Name="Images for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$XXX_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# uses jq & amqp-tools

# install tesseract
# https://github.com/tesseract-ocr/tessdoc
RUN  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y --no-install-recommends install tesseract-ocr tesseract-ocr-all
#  apt-get -y --no-install-recommends install tesseract-ocr-all  && \
#  apt-get -y --no-install-recommends install tesseract-ocr-deu tesseract-ocr-deu-frak
#apt-get install tesseract-ocr-eng

# install Latex
RUN apt-get -y --no-install-recommends install texlive-full latex-make latex2html 
# python3-latexcodec 
 
# opencv?

# install image magick
# https://imagemagick.org/script/magick.php
# https://wiki.ubuntuusers.de/ImageMagick/
RUN apt-get -y --no-install-recommends install imagemagick


#zoomify
#http://libvips.blogspot.com/2013/03/making-deepzoom-zoomify-and-google-maps.html
#https://libvips.github.io/libvips/API/current/Making-image-pyramids.md.html
#https://openseadragon.github.io/examples/creating-zooming-images/
#https://libvips.github.io/libvips/API/current/using-cli.html
RUN apt-get -y --no-install-recommends install libvips-tools libvips-dev  


#tesseract /home/kmicha/Pictures/frz.1863-06-03.02.jpg ./tess.hocr -l deu_frak -psm 1 hocr
#tesseract /home/kmicha/Pictures/frz.1863-06-03.02.jpg ./tess.txt -l deu_frak -psm 1
#tesseract  --version
#tesseract --list-langs
#tesseract-ocr tesseract-ocr-deu tesseract-ocr-deu-frak


RUN mkdir -p /cre && touch /cre/versions.txt && \
   echo "$(date +'%F %R') \t creImage \t $XXX_VERSION" >> /cre/versions.txt && \
   echo "$(date +'%F %R') \t \t $(tesseract --version | grep tesseract)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t \t $(convert -version | grep Version)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t \t $(vips -version)" >> /cre/versions.txt && \ 
   echo "$(date +'%F %R') \t \t $(latex --version | grep Debian)" >> /cre/versions.txt 


COPY cre /cre
#WORKDIR /cre/

#USER elasticsearch

#VOLUME ["/usr/share/elasticsearch"]
