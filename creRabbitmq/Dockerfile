#
# RabbitMQ Dockerfile
#
# https://github.com/tamboraorg/docker/crerabbitmq
#

# Pull base image. 
FROM tamboraorg/creerlang:latest

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2018
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV RABBITMQ_VERSION 3.8.0

LABEL Name="RabbitMQ for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$RABBITMQ_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install RabbitMQ

# https://computingforgeeks.com/how-to-install-latest-rabbitmq-server-on-ubuntu-linux/

#sudo apt update && sudo apt install wget -y
RUN apt install apt-transport-https -y
RUN wget -O- https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc | sudo apt-key add -
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -

#--- Ubuntu 20.04 ---
# echo "deb https://dl.bintray.com/rabbitmq-erlang/debian focal erlang-22.x" | sudo tee /etc/apt/sources.list.d/rabbitmq.list

# --- Ubuntu 18.04 ---
RUN echo "deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang-22.x" | sudo tee /etc/apt/sources.list.d/rabbitmq.list


RUN apt update  -y  && apt install  -y rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management

# delay plugin
RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v${RABBITMQ_VERSION}/rabbitmq_delayed_message_exchange-${RABBITMQ_VERSION}.ez  -O ${RABBITMQ_PLUGINS_DIR}/rabbitmq_delayed_message_exchange-${RABBITMQ_VERSION}.ez
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange



COPY cre /cre
WORKDIR /cre/

EXPOSE 15672
#EXPOSE 4369 5671 5672 15691 15692 25672

# ENTRY-POINT /cre/start-rabbitmq.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

#CMD ["ls", "-l"]
CMD ["rabbitmq-server"]
