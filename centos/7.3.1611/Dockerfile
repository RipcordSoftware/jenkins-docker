FROM centos:7.3.1611
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root
ENV GCC_VER 5.4.0
ENV GCC_SUFFIX 5.4

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release

# C++ tools
RUN yum install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel libboost-devel cppunit-devel

# build GCC 5.4
RUN yum install -y libmpc-devel mpfr-devel gmp-devel && \
    curl -L ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 -O && \
    tar xf gcc-${GCC_VER}.tar.bz2 && \
    pushd gcc-${GCC_VER} && \
    ./configure --disable-multilib --enable-languages=c,c++ --program-suffix=-${GCC_SUFFIX} && \
    make -j4 && \
    make install && \
    popd && \
    rm -rf gcc-${GCC_VER} && \
    echo 'export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH' > /etc/profile.d/ld-library-path.sh

# other languages
RUN yum install -y ruby
RUN yum install -y java-1.8.0-openjdk-headless
RUN yum install -y nodejs npm
RUN yum install -y python python-pip python34 python34-pip
RUN yum install -y golang

# other language tools and libs
RUN yum install -y lcov
RUN pip install --upgrade pip
RUN pip install json_tools
RUN pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
