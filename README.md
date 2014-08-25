# Docker image for JBoss Overlord DTGov
This docker image will install a DTGov server on top of an [EAP server][jboss_eap].

Default workflows will be installed in the image.

## Build steps
Make sure to have in files:
* [__dtgov-1.3.0.Final.zip__][dtgov]
* [__s-ramp-0.5.0.Final.zip__][sramp]
* [__apache-ant-1.9.4.tar.gz__][ant]

If the required files are not in __files__ directory of this repository, build script will try to fetch them from the internet, so internet connection will be required at build time.

## Installation details
* OS user: __jboss__
* HOME: __/home/jboss__
* EAP_HOME; __/home/jboss/jboss-eap-6.3__
* EAP_USER: __admin/admin123!__

By default, management and service interfaces bound to __0.0.0.0__

Profile run by default: __standalone.xml__

[jboss_eap]: https://github.com/jorgemoralespou/docker-jboss-eap
[dtgov]: http://downloads.jboss.org/overlord/dtgov/dtgov-1.3.0.Final.zip
[sramp]: http://downloads.jboss.org/overlord/sramp/s-ramp-0.5.0.Final.zip
[ant]: http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz
