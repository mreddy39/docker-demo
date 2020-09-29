FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
ADD ${JAR_FILE} app.jar
COPY pod_restart.sh /pod_restart.sh
RUN chmod 777 /pod_restart.sh
EXPOSE 8080
ENTRYPOINT ["java","-Dserver.port=8080", "-jar","/app.jar"]
