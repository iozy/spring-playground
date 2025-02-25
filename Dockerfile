FROM eclipse-temurin:17-jre as builder
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM eclipse-temurin:17-jre
COPY --from=builder dependencies/ ./
COPY --from=builder snapshot-dependencies/ ./
COPY --from=builder spring-boot-loader/ ./
COPY --from=builder application/ ./

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
#ENTRYPOINT ["java", "-jar", "/app.jar"]
