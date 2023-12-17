FROM maven:3.8.5-openjdk-17-slim

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/cinema-0.0.1-SNAPSHOT.jar"]
