FROM ubuntu:14.04
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# update apt and install basic tools
RUN apt-get update -qq && \
    apt-get install -y -qq apt-utils sudo curl wget unzip bzip2 xz-utils pkg-config rsync net-tools telnet

# C++ tools
RUN apt-get install -y -qq git gcc g++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN apt-get install -y -qq zlib1g-dev libboost-all-dev libcppunit-dev

# Ruby
RUN apt-get install -y -qq ruby && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io | bash -s stable && \
    /bin/bash -c 'source /etc/profile.d/rvm.sh && rvm install --default 2.3 && gem install rspec bundler'

# other languages
RUN apt-get install -y -qq openjdk-7-jdk && \
    apt-get install -y -qq nodejs nodejs-legacy npm && \
    apt-get install -y -qq python python-pip python3 python3-pip && \
    apt-get install -y -qq golang

# other language tools and libs
RUN apt-get install -y -qq lcov && \
    pip install --upgrade pip && \
    pip install json_tools && \
    pip install u-msgpack-python

# database servers
RUN apt-get install -y -qq couchdb && mkdir /var/run/couchdb && chown couchdb:couchdb /var/run/couchdb

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
