FROM ruby:2.3.1
MAINTAINER Chris Horn <chorn@chorn.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -yqq && apt-get upgrade -yqq && apt-get install -yqq wget
RUN cd /usr/local/share && wget -nv https://cnpmjs.org/mirrors/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
RUN (wget -qO- https://deb.nodesource.com/setup_7.x | bash -) && apt-get install -yqq nodejs
RUN rm -rf /var/lib/apt/lists/*
