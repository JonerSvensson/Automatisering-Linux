#!/bin/bash

EC2_HOST="JavaApp"
APP_DIR="/home/ec2-user/app"
JAR_NAME="myapp.jar"
PROJECT_DIR="./javaapp"


echo "Bygger JAR lokalt"
cd $PROJECT_DIR
mvn clean package -DskipTests
JAR_PATH=$(find target -name "*.jar" | grep -v original)
echo "JAR byggd: $JAR_PATH"

echo ""
echo "Skickar till EC2 (SCP)"
scp $JAR_PATH $EC2_HOST:$APP_DIR/$JAR_NAME
echo "Uppladdad"

echo ""
echo "SSH och byter ut gammal JAR"
ssh $EC2_HOST << EOF
    echo "Startar om servicen..."
    sudo systemctl restart myapp

    echo "Status:"
    sudo systemctl status myapp --no-pager
EOF

echo ""
echo "Deploy klar"