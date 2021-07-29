FROM openjdk:16-alpine3.13 
WORKDIR /JavaWeb
COPY . .
FROM maven as dev

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
