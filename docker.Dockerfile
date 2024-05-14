FROM eclipse-temurin:17
RUN mkdir /app
#RUN ["executable", "param1", "param2"]
WORKDIR /app
COPY target/api.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]