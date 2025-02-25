# Usar a imagem oficial do OpenJDK 21
FROM eclipse-temurin:21-jdk

# Definir diretório de trabalho
WORKDIR /app

# Copiar o arquivo JAR da aplicação
COPY target/auth-api-0.0.1-SNAPSHOT.jar app.jar

# Expôr a porta da aplicação
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]

