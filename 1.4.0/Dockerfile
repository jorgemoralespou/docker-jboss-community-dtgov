# Steps taken to create this image
# docker build --rm -t jboss.org/dtgov:1.3.0  .
# docker run -p 9990:9990 -p 9999:9999 -p 8080:8080 -it jboss.org/dtgov:1.3.0
#
#
FROM jmorales/jboss-eap:6.3.0

ENV DTGOV_VERSION 1.4.0.Final
ENV SRAMP_VERSION 0.6.0.Final

ADD files/install-workflows.sh /tmp/

ENV ANT_HOME /tmp/apache-ant-1.9.4

RUN cd /tmp \
    && curl http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz | bsdtar -zxvf- \
    && curl http://downloads.jboss.org/overlord/sramp/s-ramp-$SRAMP_VERSION.zip | bsdtar -xvf- \
    && curl http://downloads.jboss.org/overlord/dtgov/dtgov-$DTGOV_VERSION.zip | bsdtar -xvf- \
    && ${ANT_HOME}/bin/ant -f /tmp/s-ramp-$SRAMP_VERSION/build.xml -Ds-ramp-distro.choices.platform=1 -Ds-ramp-distro.choices.platform.jboss-eap-6.path=$EAP_HOME -Doverlord-commons.admin.password=admin123! \
    && ${ANT_HOME}/bin/ant -f /tmp/dtgov-$DTGOV_VERSION/build.xml -Ddtgov-distro.choices.platform=1 -Ddtgov-distro.choices.platform.jboss-eap-6.path=$EAP_HOME \
    && /tmp/install-workflows.sh \
    && rm -rf /tmp/apache-ant-1.9.4 && rm -rf /tmp/s-ramp-0.6.0.Final && rm -rf /tmp/dtgov-1.4.0.Final && rm -rf $EAP_HOME/standalone/tmp && rm -rf $EAP_HOME/standalone/data/content

ENTRYPOINT ["/home/jboss/jboss-eap-6.3/bin/standalone.sh"]
CMD ["-c", "standalone-full.xml"]
