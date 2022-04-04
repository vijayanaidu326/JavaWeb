FROM maven:3-openjdk-8 as build
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package

FROM tomcat:8-alpine
COPY -–from=build /JavaWeb/target/WebAppCal-0.0.6 /usr/local/tomcat/webapps
EXPOSE 8080
