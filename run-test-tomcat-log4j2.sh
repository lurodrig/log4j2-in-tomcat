#!/bin/sh

docker rm test-tomcat-log4j2
docker build -t 9.0.16-jre8-log4j2 .
docker run -p 8080:8080 -v /tmp/tomcat/webapps:/usr/local/tomcat/webapps --name test-tomcat-log4j2 9.0.16-jre8-log4j2
