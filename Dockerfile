FROM centos as dev
RUN yum -y install java-1.8.0
RUN yum -y install git
RUN yum -y install maven
WORKDIR /JavaWeb
COPY . .
RUN mvn clean
RUN mvn package

FROM tomcat
COPY --from=dev /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
