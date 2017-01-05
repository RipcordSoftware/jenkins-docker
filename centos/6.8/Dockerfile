FROM centos:6.8
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release

# C++ tools
RUN yum install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel cppunit-devel

# build GCC 4.9
RUN yum install -y libmpc-devel mpfr-devel gmp-devel && \
    curl -L ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.bz2 -O && \
    tar xfj gcc-4.9.2.tar.bz2 && \
    cd gcc-4.9.2 && \
    ./configure --disable-multilib --enable-languages=c,c++ --program-suffix=-4.9 && \
    make -j4 && \
    make install

# other languages
RUN yum install -y ruby
RUN yum install -y java-1.8.0-openjdk-headless
RUN yum install -y nodejs npm
RUN yum install -y golang

# other language tools and libs
RUN yum install -y lcov
#RUN pip install json_tools
#RUN pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# we need a new(ish) Boost
#RUN wget http://repo.enetres.net/enetres.repo -O /etc/yum.repos.d/enetres.repo && yum install -y boost-devel
