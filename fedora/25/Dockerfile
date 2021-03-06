FROM fedora:25
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# install basic tools
RUN dnf install -y sudo curl wget unzip bzip2 xz pkgconfig rsync net-tools which telnet nano

# C++ tools
RUN dnf install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache rpm-build

# C++ libraries
RUN dnf install -y zlib-devel boost-devel cppunit-devel

# other languages
RUN dnf install -y ruby ruby-devel rubygems rubygem-bundler rubygem-rspec && \
    dnf install -y java-1.8.0-openjdk-headless && \
    dnf install -y nodejs npm && \
    dnf install -y python python-pip python34 python3-pip && \
    dnf install -y golang

# other language tools and libs
RUN dnf install -y lcov && \
    pip install --upgrade pip && \
    pip install json_tools && \
    pip install u-msgpack-python

# database servers
RUN dnf install -y couchdb

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
