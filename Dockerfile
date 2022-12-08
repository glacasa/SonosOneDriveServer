FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM tomcat:latest
COPY --from=build /home/app/target/SonosOneDriveServer.war /usr/local/tomcat/webapps/