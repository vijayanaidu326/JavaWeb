FROM centos as dev
yum -y install git
yum -y install java-1.8.0
yum -y install maven
WORKDIR /JavaWeb
COPY . .
RUN mvn package

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
