#!/bin/bash

set -e

# Start RMQ from entry point.
# This will ensure that environment variables passed
# will be honored
/usr/local/bin/docker-entrypoint.sh rabbitmq-server -detached

# Do the cluster dance
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbitmq-01

# Stop the entire RMQ server. This is done so that we
# can attach to it again, but without the -detached flag
# making it run in the forground
rabbitmqctl stop
#rabbitmqctl start_app

# Wait a while for the app to really stop
sleep 4s

# Start it
rabbitmq-server