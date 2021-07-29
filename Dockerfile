FROM openjdk:16-alpine3.13 as dev
FROM maven
WORKDIR /JavaWeb
COPY . .
RUN mvn package

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
