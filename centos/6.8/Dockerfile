FROM centos:6.8
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release

# add SciLinux for GCC 4.9
RUN rpm --import http://linuxsoft.cern.ch/cern/slc6X/x86_64/RPM-GPG-KEY-cern
RUN wget http://linuxsoft.cern.ch/cern/scl/slc6-scl.repo -O /etc/yum.repos.d/slc6-scl.repo
RUN yum -y --nogpgcheck install devtoolset-3-gcc devtoolset-3-gcc-c++
RUN ln -s /opt/rh/devtoolset-3/enable /etc/profile.d/devtoolset-3-enable.sh

# C++ tools
RUN yum install -y git make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel cppunit-devel

# we need a new(ish) Boost
RUN wget http://repo.enetres.net/enetres.repo -O /etc/yum.repos.d/enetres.repo && yum install -y boost-devel

# other languages
RUN yum install -y ruby
RUN yum install -y java-1.8.0-openjdk-headless
RUN yum install -y nodejs npm
RUN yum install -y python python-pip python27 python34
RUN yum install -y golang

# other language tools and libs
RUN yum install -y lcov
RUN pip install --upgrade pip
RUN pip install json_tools
RUN pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
