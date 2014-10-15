#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#tar -xvzf /files/apache-ant-1.9.4-bin.tar.gz -C /working

ANT_HOME=/working/apache-ant-1.9.4
export ANT_HOME

#unzip /files/s-ramp-0.5.0.Final.zip -d /working
#unzip /files/dtgov-1.3.0.Final.zip -d /working

${ANT_HOME}/bin/ant -f /working/s-ramp-0.5.0.Final/build.xml -Ds-ramp-distro.choices.platform=1 -Ds-ramp-distro.choices.platform.jboss-eap-6.path=/home/jboss/jboss-eap-6.3 -Doverlord-commons.admin.password=admin123!
${ANT_HOME}/bin/ant -f /working/dtgov-1.3.0.Final/build.xml -Ddtgov-distro.choices.platform=1 -Ddtgov-distro.choices.platform.jboss-eap-6.path=/home/jboss/jboss-eap-6.3

/files/install-workflows.sh

