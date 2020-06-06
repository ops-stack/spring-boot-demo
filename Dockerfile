# Maven build container 

FROM maven:3.5.2-jdk-8-alpine AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package


#pull base image

FROM openjdk:8-jdk-alpine

MAINTAINER Pradip Rawat <pradip.rawat@stratus.com>

VOLUME /tmp

ADD /target/*.jar app.jar
COPY --from=maven_build /tmp/target/*.jar app.jar

RUN sh -c 'touch /app.jar'

ENTRYPOINT [ "java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--server.port=80"]
