FROM tomcat:9.0

ARG OPENTHESO_VERSION=23.09.01
ADD https://github.com/miledrousset/Opentheso2/releases/download/v${OPENTHESO_VERSION}/opentheso2-${OPENTHESO_VERSION}.war /usr/local/tomcat/webapps/opentheso2.war

RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean

RUN apt-get install zip unzip


RUN mkdir /usr/local/tomcat/webapps/opentheso2 \
	&& unzip -d /usr/local/tomcat/webapps/opentheso2/ /usr/local/tomcat/webapps/opentheso2.war \
	&& mkdir -p /var/www/images/resize


# Modify the config for Opentheso
COPY preferences.properties /usr/local/tomcat/webapps/opentheso2/WEB-INF/classes/
COPY hikari.properties /usr/local/tomcat/webapps/opentheso2/WEB-INF/classes/
COPY hibernate.cfg.xml /usr/local/tomcat/webapps/opentheso2/WEB-INF/classes/
