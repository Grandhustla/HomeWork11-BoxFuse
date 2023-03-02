##Code for install docker container
#FROM ubuntu:18.04 as basebuild
#
## Install maven and git for pipeline Jenkins
#RUN apt update && apt install git maven docker.io -y
#
#FROM tomcat:9.0.72-jdk11-temurin-jammy
#COPY --from=basebuild /target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war




FROM tomcat:9.0.71-jdk11-temurin-jammy
ADD ./target/hello-1.0.war /usr/local/tomcat/webapps/