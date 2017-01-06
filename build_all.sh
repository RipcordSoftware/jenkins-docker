#!/usr/bin/env bash

ROOT=`dirname $0`

for df in `find $ROOT | grep Dockerfile`
do
    DIR=`dirname $df`
    echo "**************************************************************"    
    echo "* Building: ${DIR}"
    echo "**************************************************************"
    pushd $DIR
    ./build.sh
    STATUS=$?
    if [ $STATUS -ne 0 ]; then exit $STATUS; fi
    popd
done
