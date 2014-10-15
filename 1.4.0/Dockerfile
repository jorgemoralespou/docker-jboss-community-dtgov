# Steps taken to create this image
# docker build --rm -t jboss.org/dtgov:1.3.0  .
# docker run -p 9990:9990 -p 9999:9999 -p 8080:8080 -it jboss.org/dtgov:1.3.0
#
#
FROM jmorales/jboss-eap:6.3.0

ENV DTGOV_VERSION 1.4.0.Final
ENV SRAMP_VERSION 0.6.0.Final

ADD files/apache-ant-1.9.4-bin.tar.gz /home/jboss/
ADD files/dtgov-$DTGOV_VERSION.zip /tmp/
ADD files/s-ramp-$SRAMP_VERSION.zip /tmp/
ADD files/install-workflows.sh /tmp/

ENV ANT_HOME /home/jboss/apache-ant-1.9.4

RUN unzip /tmp/s-ramp-$SRAMP_VERSION.zip -d /tmp
RUN unzip /tmp/dtgov-$DTGOV_VERSION.zip -d /tmp

RUN ${ANT_HOME}/bin/ant -f /tmp/s-ramp-$SRAMP_VERSION/build.xml -Ds-ramp-distro.choices.platform=1 -Ds-ramp-distro.choices.platform.jboss-eap-6.path=/home/jboss/jboss-eap-6.3 -Doverlord-commons.admin.password=admin123!
RUN ${ANT_HOME}/bin/ant -f /tmp/dtgov-$DTGOV_VERSION/build.xml -Ddtgov-distro.choices.platform=1 -Ddtgov-distro.choices.platform.jboss-eap-6.path=/home/jboss/jboss-eap-6.3

RUN /tmp/install-workflows.sh

#RUN rm -rf /tmp/dtgov* ; rm -rf /tmp/s-ramp*; rm -rf /tmp/apache-ant*; rm -rf install-*

ENTRYPOINT ["/home/jboss/jboss-eap-6.3/bin/standalone.sh"]
CMD ["-c", "standalone-full.xml"]
