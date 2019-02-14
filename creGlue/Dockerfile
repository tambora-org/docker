#
# Glue Dockerfile 
#
# https://github.com/tamboraorg/docker/creglue
#

# Pull base image.
FROM tamboraorg/creubuntu:2010.0
MAINTAINER Michael Kahle <michael.kahle@yahoo.de>

ARG BUILD_YEAR=2010
ARG BUILD_MONTH=0
# version: yyyy.n for stable versions / 0.yyyy for development
#ENV CRE_VERSION 0.2010 # Derrived from Ubuntu Base Image creubuntu
ENV YEAR $BUILD_YEAR
ENV MONTH $BUILD_MONTH
ENV DOCKER_GEN_VERSION 0.7.4
ENV DOCKER_HOST unix:///tmp/docker.sock

LABEL Name="Glue for CRE" \
      Year=$BUILD_YEAR \
      Month=$BUILD_YEAR \
      Version=$DOCKER_GEN_VERSION \
      OS="Ubuntu:$UBUNTU_VERSION" \
      Build_=$CRE_VERSION 

## only available inside hooks...
#      SOURCE_BRANCH=$SOURCE_BRANCH \
#      SOURCE_COMMIT=$SOURCE_COMMIT \
#      COMMIT_MSG=$COMMIT_MSG \
#      DOCKER_REPO=$DOCKER_REPO \
#      DOCKERFILE_PATH=$DOCKERFILE_PATH \
#      CACHE_TAG=$CACHE_TAG \
#      IMAGE_NAME=$IMAGE_NAME \

# Install docker-gen (generates files from templates with docker data filled in)
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN mkdir -p /cre && touch /cre/versions.txt && \
    echo "$(date +'%F %R') \t  docker-gen \t $(docker-gen -version)" >> /cre/versions.txt 

COPY cre /cre
WORKDIR /cre/glue

ENTRYPOINT ["/cre/glue-entrypoint.sh"]
CMD ["shoreman", "/cre/glue-procfile"]
