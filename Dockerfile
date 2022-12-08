FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

CMD ["mvn", "-f", "/home/app/pom.xml", "tomcat:run-war"]