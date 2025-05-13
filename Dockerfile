Crear un archivo “Dockerfile” en el repositorio:
FROM openjdk:11
COPY target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
