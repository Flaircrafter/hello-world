# Pull base image 
From tomcat:jdk8-adoptopenjdk-openj9 

# Maintainer 
MAINTAINER "random"
 
COPY ./webapp.war /usr/local/tomcat/webapps
