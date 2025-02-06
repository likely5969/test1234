# Base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the JAR file from the host into the container
COPY target/sht_webapp.jar /app/app.jar

# Expose the port that your Spring Boot app runs on
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]