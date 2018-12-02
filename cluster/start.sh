#!/usr/bin/env bash

set -e
clear
#EOF

cat << EOF
===================================================
RabbitMQ-STOMP test
===================================================
EOF

echo -e "\n"
docker --version
docker-compose --version

# Run docker compose building the images
docker-compose up  --build -d