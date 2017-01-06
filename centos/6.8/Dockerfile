FROM centos:6.8
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root
ENV GCC_VER 4.9.2
ENV GCC_SUFFIX 4.9

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release net-tools telnet

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
    echo 'export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH' > /etc/profile.d/ld-library-path.sh

# other languages
RUN yum install -y ruby rubygems rubygem-bundler
RUN yum install -y java-1.8.0-openjdk-headless
RUN yum install -y nodejs npm
RUN yum install -y golang

# other language tools and libs
RUN yum install -y lcov
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python2.7 get-pip.py && \
    pip install json_tools && \
    pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
