FROM openjdk:8-jdk-alpine

MAINTAINER Pradip Rawat <pradip.rawat@stratus.com>

VOLUME /tmp

ADD /target/*.jar app.jar

RUN sh -c 'touch /app.jar'

ENTRYPOINT [ "java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--server.port=80"]
