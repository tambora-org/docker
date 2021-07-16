#
# RabbitMQ Dockerfile
#
# https://github.com/tamboraorg/docker/crerabbitmq
#

# Pull base image. 
FROM tamboraorg/creerlang:latest

MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2020
ARG BUILD_MONTH=0
ARG BUILD_TAG=latest

# version: yyyy.n for stable versions / 0.yyyy for development
ENV INITRD No
ENV RABBITMQ_VERSION 3.8.17   # 3.6.0

 
LABEL Name="RabbitMQ for CRE" \
      CRE=$CRE_VERSION \ 
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$RABBITMQ_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$BUILD_TAG 

# Install RabbitMQ

# https://computingforgeeks.com/how-to-install-latest-rabbitmq-server-on-ubuntu-linux/
# https://www.rabbitmq.com/install-debian.html#apt

#--- Ubuntu 20.04 OLD ---
## RUN apt install apt-transport-https -y \
##  && wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add - 
## RUN echo "deb https://dl.bintray.com/rabbitmq-erlang/debian focal erlang-22.x" | sudo tee /etc/apt/sources.list.d/rabbitmq.list

#--- Ubuntu 20.04 NEW ---
RUN apt-key adv --keyserver "hkps://keys.openpgp.org" --recv-keys "0x0A9AF2115F4687BD29803A206B73A36E6026DFCA"
RUN apt-key adv --keyserver "keyserver.ubuntu.com" --recv-keys "F77F1EDA57EBB1CC"
RUN curl -1sLf 'https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey' | sudo apt-key add -
RUN apt install apt-transport-https -y \
RUN echo "deb http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
RUN echo "deb https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ focal main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list


# --- Ubuntu 18.04 ---
# RUN apt-key adv --keyserver "hkps://keys.openpgp.org" --recv-keys "0x0A9AF2115F4687BD29803A206B73A36E6026DFCA"
# RUN apt-key adv --keyserver "keyserver.ubuntu.com" --recv-keys "F77F1EDA57EBB1CC"
# RUN curl -1sLf 'https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey' | sudo apt-key add -
# RUN apt install apt-transport-https -y \
# RUN echo "deb http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
# RUN echo "deb https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list

#list available packages
RUN apt list -a rabbitmq-server

RUN apt update  -y  && apt install -y rabbitmq-server=3.8.\* \
 && rabbitmq-plugins enable rabbitmq_management

# works
# RUN rabbitmq-plugins list
# RUN rabbitmq-diagnostics help
# RUN rabbitmq-diagnostics status --help


# RUN ls -l /usr/lib/rabbitmq/lib
# RUN ls -l /usr/lib/rabbitmq/lib/rabbitmq_server-3.8.2/plugins

# node needs to run...
# RUN rabbitmq-diagnostics environment
# RUN rabbitmq-diagnostics erlang_version

#ENV RABBITMQ_VERSION2 $(rabbitmqctl version/abbit/)
#RUN echo "$RABBITMQ_VERSION2"

RUN RABBITMQ_VERSION2=$(rabbitmqctl version | sed -e 's|abbit||') && \
    echo $RABBITMQ_VERSION2

COPY cre /cre
WORKDIR /cre/ 
# ENV RABBITMQ_HOME /usr/lib/rabbitmq/lib/rabbitmq_server-3.8.2/
ENV RABBITMQ_PLUGINS_DIR /cre/plugins:/usr/lib/rabbitmq/lib/rabbitmq_server-3.8.19/plugins
# :/usr/lib/rabbitmq/plugins:$RABBITMQ_HOME/plugins

# delay plugin     (3.8.9 -> 20.04?)
# https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez
# https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez
# https://bintray.com/rabbitmq/community-plugins/download_file?file_path=rabbitmq_delayed_message_exchange-0.0.1.ez
# https://dl.bintray.com/rabbitmq/community-plugins/3.6.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip  -> ez

## RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez -O /cre/plugins/rabbitmq_delayed_message_exchange.ez
   

RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.17/rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez -O /cre/plugins/rabbitmq_delayed_message_exchange.ez
# RUN cp /cre/plugins/v3.8/rabbitmq_delayed_message_exchange-3.8.0.ez /cre/plugins/rabbitmq_delayed_message_exchange.ez 
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# https://www.rabbitmq.com/web-mqtt.html  ##port:15675
RUN rabbitmq-plugins enable rabbitmq_mqtt
RUN rabbitmq-plugins enable rabbitmq_web_mqtt


RUN mkdir -p /cre && touch /cre/versions.txt && \ 
    echo "$(date +'%F %R') \t rabbitMq \t $(rabbitmqctl version)" >> /cre/versions.txt 

EXPOSE 15672 15675 5672 25672 1883   
#  4369 5671 5672 15691 15692 

ENTRYPOINT ["/cre/rabbitmq-entrypoint.sh"]

CMD ["shoreman", "/cre/rabbitmq-procfile"]
