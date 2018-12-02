#!/usr/bin/env bash

set -e
clear
#EOF

cat << EOF
===================================================
RabbitMQ-STOMP test
===================================================
EOF

echo -e "Stopping services...\n"
docker-compose down

echo -e "Cleaning images and volumes...\n"
#docker system prune -a -f
docker volume prune -f