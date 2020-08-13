FROM ubuntu:18.04
MAINTAINER Avner Cohen "israbirding@gmail.com"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential git curl zip inotify-tools python

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

ENV FONTELLO_VERSION 8.0.0
RUN git clone -b "${FONTELLO_VERSION}" git://github.com/fontello/fontello.git fontello \
    && cd fontello \
    && npm install \
    && git submodule init \
    && git submodule update

WORKDIR /fontello

CMD [ "node", "/fontello/server.js" ]