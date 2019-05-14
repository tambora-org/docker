# Covise
# https://github.com/tamboraorg/docker/crecovise
# https://github.com/hlrs-vis/covise

# Pull base image.
FROM tamboraorg/crepython:2010.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

# version: yyyy.n for stable versions / 0.yyyy for development
ENV DEBIAN_FRONTEND noninteractive 
ENV INITRD No
#ENV LANG en_US.UTF-8
ENV COVICE_VERSION 999999 

RUN sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
RUN add-apt-repository http://dl.openfoam.org/ubuntu
RUN apt-get update
RUN apt-get -y install openfoam6

RUN apt-get install build-essential git gfortran libopenmpi-dev openmpi-common openmpi-bin cmake libblas-dev  liblapack-dev petsc-dev 
RUN apt-get install libQt5WebKitWidgets5 libQt5Gui5 libQt5Svg5 libQt5PrintSupport5 libQt5UiTools5 libQt5Script5 libQt5ScriptTools5
RUN apt-get install libqt5core5a libqt5network5 libqt5xml5 libqt5widgets5  libqt5webkit5 libqt5gui5 libqt5svg5 libqt5printsupport5  libqt5script5 libqt5scripttools5
RUN apt-get install libboost-all-dev python3 
RUN apt-get install libopenscenegraph-3.4-131 libopenscenegraph-3.4-dev openscenegraph-3.4 openscenegraph-3.4-doc openscenegraph-3.4-examples 
RUN apt-get install libinventor1 inventor-clients inventor-data inventor-demo inventor-dev inventor-doc libxerces-c-dev libxerces-c-doc libxerces-c-samples libtiff-dev  
RUN apt-get install freeglut3 freeglut3-dev
RUN apt-get install qttools5-dev qtscript5-dev libqt5scripttools5 libqt5svg5-dev libqt5opengl5-dev libqt5webkit5-dev
RUN apt-get install libglew-dev libglew2.0
RUN apt-get install pyqt5-dev pyqt5-dev-tools
RUN cd /cre
RUN git clone https://github.com/hlrs-vis/covise.git --recursive
RUN cd /cre/covise
RUN source .covise.sh
RUN export QT_SELECT=qt5
RUN make

WORKDIR /cre/covise

CMD ["sleep 1000000"]
