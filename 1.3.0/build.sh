#!/bin/bash

if [ ! -f files/apache-ant-1.9.4-bin.tar.gz ]
then
   wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz -P files
fi
[ ! -f files/apache-ant-1.9.4-bin.tar.gz ] && echo "No ant (apache-ant-1.9.4-bin.tar.gz) available in files dir" && exit 255

if [ ! -f files/dtgov-1.3.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/dtgov/dtgov-1.3.0.Final.zip -P files
fi
[ ! -f files/dtgov-1.3.0.Final.zip ] && echo "No DTGov (dtgov-1.3.0.Final.zip) available in files dir" && exit 255

if [ ! -f files/s-ramp-0.5.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/sramp/s-ramp-0.5.0.Final.zip -P files
fi
[ ! -f files/s-ramp-0.5.0.Final.zip ] && echo "No S-RAMP (s-ramp-0.5.0.Final.zip) available in files dir" && exit 255

docker build --rm -t jmorales/jboss.org-dtgov:1.3.0  .

