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
ENV RABBITMQ_VERSION 3.8.0   # 3.6.0


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
RUN echo "deb https://dl.bintray.com/rabbitmq-erlang/debian focal erlang-22.x" | sudo tee /etc/apt/sources.list.d/rabbitmq.list

# --- Ubuntu 18.04 ---
# RUN echo "deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang-22.x" | sudo tee /etc/apt/sources.list.d/rabbitmq.list



##RUN ls -l /usr/lib/rabbitmq/lib


RUN apt update  -y  && apt install  -y rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management

RUN rabbitmq-plugins list
## RUN rabbitmq-plugins directories -s
RUN rabbitmq-diagnostics help
RUN rabbitmq-diagnostics status --help
#rabbitmqctl add_user "a-user" "a-pa$$w0rd"
RUN which rabbitmq-plugins
#RUN rabbitmqctl environment


#RUN ls -l /
#RUN ls -l /usr
#RUN ls -l /usr/local
#RUN ls -l /usr/lib
#RUN ls -l /usr/lib/rabbitmq
#RUN ls -l /usr/lib/rabbitmq/autocomplete
#RUN ls -l /usr/lib/rabbitmq/bin
#RUN ls -l /usr/lib/rabbitmq/lib
RUN ls -l /usr/lib/rabbitmq/lib/rabbitmq_server-3.8.2
#RUN ls -l /var
#RUN ls -l /var/local  #empty
#RUN ls -l /var/lib
#RUN ls -l /var/lib/rabbitmq
#RUN ls -l /var/lib/rabbitmq/mnesia #empty

# node needs to run...
#RUN rabbitmq-diagnostics environment
#RUN rabbitmq-diagnostics erlang_version

COPY cre /cre
WORKDIR /cre/
ENV RABBITMQ_PLUGINS_DIR /cre/plugins

#ENV RABBITMQ_PLUGINS_DIR /usr/lib/rabbitmq/lib/rabbitmq_server-version/plugins
#ENV RABBITMQ_PLUGINS_DIR $RABBITMQ_HOME/plugins
# PLUGINS_DIR

# delay plugin     (3.8.9 -> 20.04?)
# https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez
# https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez
# https://bintray.com/rabbitmq/community-plugins/download_file?file_path=rabbitmq_delayed_message_exchange-0.0.1.ez
# https://dl.bintray.com/rabbitmq/community-plugins/3.6.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip  -> ez

## RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez -O /cre/plugins/rabbitmq_delayed_message_exchange.ez
## RUN cp /cre/plugins/v3.6/rabbitmq_delayed_message_exchange.ez /cre/plugins/rabbitmq_delayed_message_exchange.ez

#RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange


EXPOSE 15672
#EXPOSE 4369 5671 5672 15691 15692 25672

# ENTRY-POINT /cre/start-rabbitmq.sh
# CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

#CMD ["ls", "-l"]
CMD ["rabbitmq-server"]
