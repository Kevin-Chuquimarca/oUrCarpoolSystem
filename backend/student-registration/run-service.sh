#!/bin/zsh

export DB_URL=jdbc:mysql://localhost:3306/student_registration_db
export DB_USERNAME=root
export DB_PASSWORD=password
export SERVER_PORT=8080

mvn spring-boot:run
