FROM eclipse-temurin:17-jre

WORKDIR /app

COPY application/target/devops-cicd-app-1.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
