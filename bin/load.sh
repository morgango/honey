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

mkdir -vp $TMP_DN

CONFIG=${LS_CONFIG:-"$LOAD_DN/simple.conf"}
TMP_CONFIG=${TMP_CONFIG:-"$TMP_DN/honey.conf"}

HOST_ARG=${1:-$(echo $DOCKER_HOST | sed 's/tcp:\/\/\(.*\):.*/\1/g')}
HOST_ARG=${HOST_ARG:-'localhost'}
HOST=${ES_HOST:-$HOST_ARG}
PORT_ARG=${2:-9200}
PORT=${ES_PORT:-$PORT_ARG}

echo "************************"
echo "Working with $HOST on port $PORT"
echo "************************"

cat $CONFIG | sed "s#localhost#$HOST:$PORT#g" | sed "s#/Users/mg/dev/demos/honey/data#$DATA_DN#g" > $TMP_CONFIG

if [ $? -eq 1 ]; then
    echo "This script requires logstash to be accessible through the PATH"
    exit
else
    cd $(dirname $(which logstash))
    ./logstash -f $TMP_CONFIG
    cd $OLDPWD
fi
