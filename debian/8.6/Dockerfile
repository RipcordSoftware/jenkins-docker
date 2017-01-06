FROM debian:8.6
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# update apt and install basic tools
RUN apt-get update -qq && \
    apt-get install -y -qq apt-utils sudo curl wget unzip bzip2 xz-utils pkg-config rsync net-tools telnet

# C++ tools
RUN apt-get install -y -qq git gcc g++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN apt-get install -y -qq zlib1g-dev libboost-all-dev libcppunit-dev

# other languages
RUN apt-get install -y -qq ruby bundler && \
    apt-get install -y -qq openjdk-7-jre-headless && \
    apt-get install -y -qq nodejs npm && \
    apt-get install -y -qq python python-pip python3 python3-pip && \
    apt-get install -y -qq golang

# other language tools and libs
RUN apt-get install -y -qq lcov && \
    pip install --upgrade pip && \
    pip install json_tools && \
    pip install u-msgpack-python

# build and install couchdb
RUN apt-get install -y erlang-nox erlang-dev && \
    apt-get install -y libnspr4 libnspr4-0d libnspr4-dev libcurl4-openssl-dev curl libicu-dev && \
    apt-get install -y libmozjs185-1.0 libmozjs185-dev && \
    wget ftp://ftp.mirrorservice.org/sites/ftp.apache.org/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz && \
    tar xzf apache-couchdb-1.6.1.tar.gz && \
    cd apache-couchdb-1.6.1 && \
    ./configure --prefix=/usr/local --with-js-lib=/usr/lib --with-js-include=/usr/include/mozjs --enable-init && \
    make -j4 && \
    make install && \
    useradd -d /var/lib/couchdb couchdb && \
    mkdir -p /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb /var/lib/couchdb && \
    chmod -R g+rw /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb && \
    chown -R couchdb:couchdb /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb && \
    ln -s /usr/local/etc/init.d/couchdb /etc/init.d/couchdb && \
    /etc/init.d/couchdb start && \
    update-rc.d couchdb defaults

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
