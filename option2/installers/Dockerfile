#
# Base image that will contain all the software installers
#
FROM jboss/base
MAINTAINER jmorales <jmorales@redhat.com>

USER root
RUN mkdir /working && chown jboss:jboss /working
USER jboss
ADD files/apache-ant-1.9.4-bin.tar.gz /working/
ADD files/dtgov-1.3.0.Final.zip /files/
ADD files/s-ramp-0.5.0.Final.zip /files/
ADD files/install-dtgov.sh /files/
ADD files/install-workflows.sh /files/

ENV ANT_HOME /working/apache-ant-1.9.4

RUN unzip /files/s-ramp-0.5.0.Final.zip -d /working
RUN unzip /files/dtgov-1.3.0.Final.zip -d /working

VOLUME /files
VOLUME /working

CMD ["/bin/bash", "-l"]
