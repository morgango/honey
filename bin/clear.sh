#!/bin/bash

export BASE_DN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

cd $BASE_DN

export BIN_DN=$BASE_DN/bin
export DATA_DN=$BASE_DN/data
export LOAD_DN=$BASE_DN/load
export MAP_DN=$BASE_DN/map
export TMP_DN=$BASE_DN/tmp
export VIZ_DN=$BASE_DN/viz

cd $OLDPWD

HOST_ARG=${1:-$(echo $DOCKER_HOST | sed 's/tcp:\/\/\(.*\):.*/\1/g')}
HOST_ARG=${HOST_ARG:-'localhost'}
HOST=${ES_HOST:-$HOST_ARG}
PORT_ARG=${2:-9200}
PORT=${ES_PORT:-$PORT_ARG}

echo "************************"
echo "Working with $HOST on port $PORT"
echo "************************"

http DELETE $HOST:$PORT/honey && http PUT $HOST:$PORT/honey @$MAP_DN/honey.map.json
