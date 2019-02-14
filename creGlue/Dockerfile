#
# Glue Dockerfile 
#
# https://github.com/tamboraorg/docker/creglue
#

# Pull base image.
FROM tamboraorg/creubuntu:2010.0

MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

# version: yyyy.n for stable versions / 0.yyyy for development
#ENV CRE_VERSION 0.2010 
ENV DOCKER_GEN_VERSION 0.7.4
ENV DOCKER_HOST unix:///tmp/docker.sock

# Install docker-gen (generates files from templates with docker data filled in)
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t  docker-gen \t $(docker-gen -version)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/glue

ENTRYPOINT ["/cre/glue-entrypoint.sh"]
CMD ["shoreman", "/cre/glue-procfile"]
