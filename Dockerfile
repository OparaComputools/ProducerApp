FROM maven:3.6.3-jdk-11 as builder
ENV JAR_NAME=app-0.0.1-SNAPSHOT.jar
RUN mkdir /tmp/app
COPY ./  /tmp/app
WORKDIR  /tmp/app
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:11-jre-slim
ENV JAR_NAME=app-0.0.1-SNAPSHOT.jar
RUN mkdir /app
COPY --from=builder /tmp/app/target/${JAR_NAME} app/${JAR_NAME}
CMD java -jar /app/${JAR_NAME}

