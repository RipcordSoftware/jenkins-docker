FROM centos:7.3.1611
MAINTAINER Craig Minihan <craig@ripcordsoftware.com>
USER root

# install basic tools
RUN yum install -y sudo curl wget unzip bzip2 xz pkgconfig rsync epel-release

# C++ tools
RUN yum install -y git gcc gcc-c++ make autoconf automake libtool doxygen valgrind ccache

# C++ libraries
RUN yum install -y zlib-devel libboost-devel cppunit-devel

# other languages
RUN yum install -y ruby
RUN yum install -y java-1.8.0-openjdk-headless
RUN yum install -y nodejs npm
RUN yum install -y python python-pip python34 python34-pip
RUN yum install -y golang

# other language tools and libs
RUN yum install -y lcov
RUN pip install json_tools
RUN pip install u-msgpack-python

# update sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
