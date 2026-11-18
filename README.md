# Readers' Haven Public Library

Static multi-page website containerized with Docker (UCP DevOps Fundamentals, Assignment 02).

## Pages
Home, Collections, Membership, Services, Contact.

## Build and run locally
    npm ci
    npm run build

## Run with Docker
    docker image build -t readers-haven-final:v2.0 .
    docker container run -d -p 8080:80 --name haven-final readers-haven-final:v2.0

Open http://localhost:8080

## Team
Faizan (Team Lead), Ali Imtiaz, Muhammad Abdullah, Hafiz Muhammad, Nimrah.
