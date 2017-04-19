FROM ruby:2.3
MAINTAINER Chris Horn <chorn@chorn.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -yqq && apt-get upgrade -yqq && apt-get install -yqq curl
RUN cd /usr/local/share && (curl -sL https://cnpmjs.org/mirrors/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xjf - ) && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN (curl -sL https://deb.nodesource.com/setup_7.x | bash -) && apt-get install -yqq nodejs
RUN cd /usr/src && (curl -sL https://download.libsodium.org/libsodium/releases/libsodium-1.0.12.tar.gz | tar xzf -) && cd libsodium-1.0.12 && ./configure && make && make install
RUN rm -rf /var/lib/apt/lists/* /usr/src/libsodium*
RUN gem update bundler
