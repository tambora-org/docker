#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephpdev
#

# Pull base image.
FROM tamboraorg/crephp:2011.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2011
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

LABEL Name="Php Dev for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PHP_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs 

# Install selected debug extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php-xdebug \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install composer and selected extensions
RUN apt-get update \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

RUN composer global require "foxy/foxy:^1.0.0"
RUN composer global install

COPY cre /cre

VOLUME ["/cre/www"]
WORKDIR "/cre/www"
