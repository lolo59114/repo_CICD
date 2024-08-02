FROM maven AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests
FROM openjdk
WORKDIR /app
COPY --from=builder /app/target/Spring_exercice1-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java","-jar","Spring_exercice1-0.0.1-SNAPSHOT.jar"]