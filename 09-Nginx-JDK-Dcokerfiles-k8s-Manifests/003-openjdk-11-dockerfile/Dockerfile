FROM openjdk:11-jdk-slim

WORKDIR /app

# Add MySQL JDBC driver
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar /app/mysql-connector-java.jar
#COPY mysql-connector-j-8.0.33.jar /app/mysql-connector-java.jar
RUN chmod +x /app/mysql-connector-java.jar

# Copy Java application source
COPY HelloPod.java .

# Compile the Java application
RUN javac HelloPod.java

# Set the command to run the application
CMD ["java", "-cp", ".:/app/mysql-connector-java.jar", "HelloPod"]

EXPOSE 8080
