FROM jpeffer/docker-rvm:latest
MAINTAINER Jonathan Peffer <jpeffer.developer@gmail.com>

WORKDIR /code

RUN apt-get -y install git

RUN mkdir -p /usr/local/www && \
    cd /usr/local/www && \
    git clone https://github.com/sarkonovich/Alexa-Hue.git && \
    cd Alexa-Hue && \
    /bin/bash -l -c "bundle install;"

