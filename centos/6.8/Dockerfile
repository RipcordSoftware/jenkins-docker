FROM centos:6.8
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root
ENV GCC_VER 4.9.2
ENV GCC_SUFFIX 4.9

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release net-tools telnet nano file which

# C++ tools
RUN yum install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel cppunit-devel

# we need a new(ish) Boost
RUN wget http://repo.enetres.net/enetres.repo -O /etc/yum.repos.d/enetres.repo && yum install -y boost-devel-1.59.0 && rm -f /etc/yum.repos.d/enetres.repo

# build Python 2.7
RUN yum install -y bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel && \
    wget --no-check-certificate https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz && \
    tar xf Python-2.7.6.tar.xz && \
    pushd Python-2.7.6 && \
    ./configure --prefix=/usr/local && \
    make -j4 && \
    make altinstall && \
    popd && \
    rm -rf Python-2.7.6

# build GCC 4.9
RUN yum install -y libmpc-devel mpfr-devel gmp-devel && \
    curl -L ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 -O && \
    tar xfj gcc-${GCC_VER}.tar.bz2 && \
    pushd gcc-${GCC_VER} && \
    ./configure --disable-multilib --enable-languages=c,c++ --program-suffix=-${GCC_SUFFIX} && \
    make -j4 && \
    make install && \
    popd && \
    rm -rf gcc-${GCC_VER} && \
    echo '/usr/local/lib64' > /etc/ld.so.conf.d/local_lib64.conf && \
    ldconfig && \
    ln -s `which ccache` /usr/lib64/ccache/g++-${GCC_SUFFIX} && \
    ln -s `which ccache` /usr/lib64/ccache/c++-${GCC_SUFFIX} && \
    ln -s `which ccache` /usr/lib64/ccache/gcc-${GCC_SUFFIX} && \
    ln -s `which ccache` /usr/lib64/ccache/cc-${GCC_SUFFIX}

# Ruby
RUN yum install -y ruby && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io | bash -s stable && \
    /bin/bash -c 'source /etc/profile.d/rvm.sh && rvm install --default 2.3 && gem install rspec bundler'

# other languages
RUN yum install -y java-1.8.0-openjdk-headless && \
    yum install -y nodejs npm && \
    yum install -y golang

# other language tools and libs
RUN yum install -y lcov
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python2.7 get-pip.py && \
    pip install json_tools && \
    pip install u-msgpack-python

# build and install SpiderMonkey 1.8.5
RUN yum install -y zip && \
    wget http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz && \
    tar xf js185-1.0.0.tar.gz && \
    cd js-1.8.5/js/src && \
    mkdir build.OPT && \
    cd build.OPT && \
    ../configure --disable-tests --enable-install-strip && \
    make -j4 && \
    make install

# build and install couchdb
RUN yum install -y erlang-asn1 erlang-erts erlang-eunit erlang-os_mon erlang-xmerl help2man libicu-devel && \
    wget ftp://ftp.mirrorservice.org/sites/ftp.apache.org/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz && \
    tar xf apache-couchdb-1.6.1.tar.gz && \
    cd apache-couchdb-1.6.1 && \
    ./configure --prefix=/usr/local --enable-init --with-erlang=/usr/lib64/erlang/erts-5.8.5/include && \
    make -j4 && \
    make install && \
    useradd -d /var/lib/couchdb couchdb && \
    mkdir -p /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb /var/lib/couchdb && \
    chmod -R g+rw /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb && \
    chown -R couchdb:couchdb /usr/local/{lib,etc}/couchdb /usr/local/var/{lib,log,run}/couchdb

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
