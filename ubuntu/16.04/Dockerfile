FROM ubuntu:16.04
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# update apt and install basic tools
RUN apt-get update -qq && \
    apt-get install -y -qq apt-utils sudo curl wget unzip bzip2 xz-utils pkg-config rsync net-tools

# C++ tools
RUN apt-get install -y -qq git gcc g++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN apt-get install -y -qq zlib1g-dev libboost-all-dev libcppunit-dev

# other languages
RUN apt-get install -y -qq ruby && \
    apt-get install -y -qq default-jdk-headless && \
    apt-get install -y -qq nodejs npm && \
    apt-get install -y -qq python python-pip python3 python3-pip && \
    apt-get install -y -qq golang

# other language tools and libs
RUN apt-get install -y -qq lcov && \
    pip install --upgrade pip && \
    pip install json_tools && \
    pip install u-msgpack-python

# database servers
RUN apt-get install -y -qq couchdb

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
