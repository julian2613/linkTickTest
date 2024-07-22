FROM gradle:jdk21 AS build
ARG HOME_DIR=/home/gradle/src
COPY --chown=gradle:gradle . $HOME_DIR
WORKDIR $HOME_DIR
RUN gradle build --no-daemon

FROM amazoncorretto:21-alpine-jdk as deplou
ARG JAR_DIR=/home/gradle/src/build/libs/
COPY --from=build $JAR_DIR /app/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/pos-0.0.1-SNAPSHOT.jar"]