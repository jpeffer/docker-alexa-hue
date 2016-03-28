FROM tzenderman/docker-rvm:latest
MAINTAINER Jonathan Peffer <jpeffer.developer@gmail.com>

COPY .ruby-version /code/.ruby-version
COPY .gemrc /code/.gemrc
COPY Gemfile /code/Gemfile
RUN rvm install $(cat .ruby-version) --disable-binary && \
    rvm use --default && \
    /bin/bash -l -c "bundle install;"

RUN apt-get install git

RUN mkdir -p /usr/local/www && \
    cd /usr/local/www && \
    git clone https://github.com/sarkonovich/Alexa-Hue.git

RUN bundle install
