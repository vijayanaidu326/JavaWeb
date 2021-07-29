FROM openjdk:16-alpine3.13 as dev
WORKDIR /JavaWeb
COPY . .
RUN mvnw package

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
