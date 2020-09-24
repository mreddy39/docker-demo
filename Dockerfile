FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
ADD ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Dserver.port=8080", "-jar","/app.jar"]
