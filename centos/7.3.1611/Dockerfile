FROM centos:7.3.1611
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release net-tools which telnet nano file which

# C++ tools
RUN yum install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel boost-devel cppunit-devel

# other languages
RUN yum install -y ruby ruby-devel rubygems rubygem-bundler rubygem-rspec && \
    yum install -y java-1.8.0-openjdk-headless && \
    yum install -y nodejs npm && \
    yum install -y python python-pip python34 python34-pip && \
    yum install -y golang

# other language tools and libs
RUN yum install -y lcov && \
    pip install --upgrade pip && \
    pip install json_tools && \
    pip install u-msgpack-python

# build and install couchdb
RUN yum install -y erlang-asn1 erlang-erts erlang-eunit erlang-os_mon erlang-xmerl help2man libicu-devel js js-devel && \
    wget ftp://ftp.mirrorservice.org/sites/ftp.apache.org/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz && \
    tar xf apache-couchdb-1.6.1.tar.gz && \
    cd apache-couchdb-1.6.1 && \
    ./configure --prefix=/usr/local --enable-init --with-erlang=/usr/lib64/erlang/erts-5.10.4/include && \
    make -j4 && \
    make install && \
    useradd -d /var/lib/couchdb couchdb && \
    mkdir -p /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb /var/lib/couchdb && \
    chmod -R g+rw /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb && \
    chown -R couchdb:couchdb /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
