#!/bin/zsh

export DB_URL=jdbc:mysql://localhost:3306/driver_approval_db
export DB_USERNAME=root
export DB_PASSWORD=password
export SERVER_PORT=8081

mvn clean package
#mvn spring-boot:run
