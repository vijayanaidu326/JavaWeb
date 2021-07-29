FROM maven as dev
WORKDIR /JavaWeb
COPY . .
RUN mvn package

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
