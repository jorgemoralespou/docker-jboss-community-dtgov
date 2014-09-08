#!/bin/bash

if [ ! -f installers/files/apache-ant-1.9.4-bin.tar.gz ]
then
   wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz -P installers/files
fi
[ ! -f installers/files/apache-ant-1.9.4-bin.tar.gz ] && echo "No ant (apache-ant-1.9.4-bin.tar.gz) available in installers/files dir" && exit 255

if [ ! -f installers/files/dtgov-1.3.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/dtgov/dtgov-1.3.0.Final.zip -P installers/files
fi
[ ! -f installers/files/dtgov-1.3.0.Final.zip ] && echo "No DTGov (dtgov-1.3.0.Final.zip) available in installers/files dir" && exit 255

if [ ! -f installers/files/s-ramp-0.5.0.Final.zip ]
then
   wget http://downloads.jboss.org/overlord/sramp/s-ramp-0.5.0.Final.zip -P installers/files
fi
[ ! -f installers/files/s-ramp-0.5.0.Final.zip ] && echo "No S-RAMP (s-ramp-0.5.0.Final.zip) available in installers/files dir" && exit 255

# Create the installers image. Installers are in a volume container, to not ocupy space
docker rmi "jboss.org/installers_dtgov:1.3.0"
docker build --rm -t "jboss.org/installers_dtgov:1.3.0"  installers/.

# Start the installer container
docker run -it --name installers_dtgov jboss.org/installers_dtgov:1.3.0 echo "Installers volume ready"
docker run -it --name "dtgov.org_install" --volumes-from installers_dtgov --entrypoint /files/install-dtgov.sh jboss/eap:6.3.0

docker stop "dtgov.org_install"
docker rm -vf installers_dtgov

# Commit the dtgov container
docker commit -m "dtgov installed" dtgov.org_install jboss.org/dtgov:1.3.0
# Delete the intermediate containers
docker rm -vf dtgov.org_install


# docker build --rm -t jboss.org/dtgov:1.3.0  dtgov/.

