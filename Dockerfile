FROM maven:3-openjdk-8
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package
EXPOSE 8080
