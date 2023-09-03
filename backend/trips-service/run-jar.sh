#!/bin/zsh

export DB_URL=jdbc:mysql://localhost:3306/trips_service_db
export DB_USERNAME=root
export DB_PASSWORD=password
export SERVER_PORT=8082

java -jar ./target/trips-service-0.0.1-SNAPSHOT.jar
