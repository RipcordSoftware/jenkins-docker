FROM debian:8.6
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# update apt and install basic tools
RUN apt-get update -qq
RUN apt-get install -y -qq apt-utils sudo curl wget unzip bzip2 xz-utils pkg-config rsync

# C++ tools
RUN apt-get install -y -qq git gcc g++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN apt-get install -y -qq zlib1g-dev libboost-all-dev libcppunit-dev

# other languages
RUN apt-get install -y -qq ruby
RUN apt-get install -y -qq default-jdk-headless
RUN apt-get install -y -qq nodejs npm
RUN apt-get install -y -qq python python-pip python3 python3-pip
RUN apt-get install -y -qq golang

# other language tools and libs
RUN apt-get install -y -qq lcov
RUN pip install --upgrade pip
RUN pip install json_tools
RUN pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
