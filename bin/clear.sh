#!/bin/bash

HOST_ARG=${1:-$(echo $DOCKER_HOST | sed 's/tcp:\/\/\(.*\):.*/\1/g')}
HOST_ARG=${HOST_ARG:-'localhost'}
HOST=${ES_HOST:-$HOST_ARG}
PORT_ARG=${2:-9200}
PORT=${ES_PORT:-$PORT_ARG}

echo "************************"
echo "Working with $HOST on port $PORT"
echo "************************"

http DELETE $HOST:$PORT/honey && http PUT $HOST:$PORT/honey @$hm/honey.map.json
