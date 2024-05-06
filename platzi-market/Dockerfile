FROM openjdk:17-jdk-slim
ADD build/libs/platzi-market-1.0.jar platzi-market-1.0.jar
ADD dbscript.sql /docker-entrypoint-initdb.d
ENTRYPOINT ["java", "-jar", "platzi-market-1.0.jar"]
