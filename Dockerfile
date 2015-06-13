FROM ubuntu:14.04
MAINTAINER Raghu Muniyal raghuschandra@gmail.com

ENV JAVA_HOME /opt/tomcat/java
RUN apt-get update

RUN mkdir /opt/tomcat
RUN useradd user
RUN apt-get install wget -y

RUN wget -P /tmp http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.tar.gz
RUN tar -xzvf /tmp/apache-tomcat-7.0.62.tar.gz --directory /opt/tomcat/ --strip 1 && rm /tmp/apache-tomcat-7.0.62.tar.gz
RUN rm -rf /opt/tomcat/webapps/*
ADD java /opt/tomcat/java
RUN chown -R user:user /opt/tomcat

ADD http://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war /opt/tomcat/webapps/
RUN mv /opt/tomcat/webapps/sample.war /opt/tomcat/webapps/hellotomcat.war

EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
