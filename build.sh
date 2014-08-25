#!/bin/bash

if [ ! -f files/apache-ant-1.9.4-bin.tar.gz ]
then
   wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz -P files
fi

if [ ! -f files/dtgov-1.3.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/dtgov/dtgov-1.3.0.Final.zip -P files
fi

if [ ! -f files/s-ramp-0.5.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/sramp/s-ramp-0.5.0.Final.zip -P files
fi

# TODO: Check that files where correctly downloaded

docker build --rm -t jboss.org/dtgov:1.3.0  .
