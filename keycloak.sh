#!/bin/bash

sudo apt update -y

sudo apt install openjdk-8-jdk

wget https://downloads.jboss.org/keycloak/8.0.1/keycloak-8.0.1.tar.gz

tar -zxf keycloak-8.0.1.tar.gz
