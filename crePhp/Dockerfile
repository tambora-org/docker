#
# Php Dockerfile
#
# https://github.com/tamboraorg/docker/crephp
#

# Pull base image.
FROM tamboraorg/creubuntu:0.2020
MAINTAINER Michael Kahle <michael.kahle@yahoo.de> 

ARG BUILD_YEAR=2012
ARG BUILD_MONTH=0

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux
#ENV PHP_VERSION 7.0    
ENV PHP_VERSION 7.2 

LABEL Name="PHP for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_MONTH \
      Version=$PHP_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t crePhp \t $PHP_VERSION " >> /cre/versions.txt

# Install cURL and nano
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends curl ca-certificates nano \
#    && apt-get clean \
#&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

## RUN add-apt-repository ppa:ondrej/php # for 7.1

# Install dotdeb repo, PHP7, composer and selected extensions
RUN apt-get update \
    && apt-get -y --no-install-recommends install php$PHP_VERSION-cli php$PHP_VERSION-curl \
        php$PHP_VERSION-intl php$PHP_VERSION-bz2 php$PHP_VERSION-imap php$PHP_VERSION-gmp ffmpeg \
        php$PHP_VERSION-json php$PHP_VERSION-opcache php$PHP_VERSION-readline \ 
        php$PHP_VERSION-xml php$PHP_VERSION-zip ssmtp libsodium-dev mailutils \
        php-dev php-pear libmcrypt-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* 
 
# removed php$PHP_VERSION-mcrypt 
# https://lukasmestan.com/install-mcrypt-extension-in-php7-2/
#
#RUN apt-get -y install autoconf pkg-config php-pear
#RUN apt-get -y install php-dev libmcrypt-dev 
RUN pecl channel-update pecl.php.net
RUN pecl install mcrypt-1.0.1
# Added to php.ini as well....

#CMD ["php", "-a"]

# If you'd like to be able to use this container on a docker-compose environment as a quiescent PHP CLI container
# you can /bin/bash into, override CMD with the following - bear in mind that this will make docker-compose stop
# slow on such a container, docker-compose kill might do if you're in a hurry
# CMD ["tail", "-f", "/dev/null"]

# Install FPM
RUN apt-get update \
    && apt-get -y --no-install-recommends install php$PHP_VERSION-fpm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# File permissions workaround
RUN usermod -u 1000 www-data

# PHP-FPM packages need a nudge to make them docker-friendly
COPY /cre/overrides.conf /etc/php/$PHP_VERSION/fpm/pool.d/z-overrides.conf
COPY /cre/php-ini-overrides.ini /etc/php/$PHP_VERSION/fpm/conf.d/99-overrides.ini


# PHP-FPM has really dirty logs, certainly not good for dockerising
# The following startup script contains some magic to clean these up
COPY cre/ /cre/
#COPY /cre/php-fpm.sh /cre/php-fpm.sh


# Open up fcgi port 
EXPOSE 9000

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php$PHP_VERSION-gd php$PHP_VERSION-mbstring  php-imagick php-ssh2 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install memcached
# maybe add 'memcached' here as well...
RUN apt-get update \
    && apt-get -y --no-install-recommends install   php-memcached \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
#pecl install memcached-3.0.4 ??

# Install db extensions and other stuff
# php$PHP_VERSION-apcu php$PHP_VERSION-apcu-bc  is depricated
RUN apt-get update \
    && apt-get -y --no-install-recommends install php-mongodb php$PHP_VERSION-pgsql php$PHP_VERSION-mysql php$PHP_VERSION-sqlite sqlite3 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN echo "$(date +'%F %R') \t  $(php -version | head -n1)" >> /cre/versions.txt 

VOLUME ["/cre/www"]

WORKDIR "/cre/www"

# Define default command.
#CMD /cre/php-fpm.sh
ENTRYPOINT ["/cre/php-entrypoint.sh"]
CMD ["shoreman", "/cre/php-procfile"]
