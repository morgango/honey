#!/bin/bash

CONFIG=${LS_CONFIG:-"$honey/load/simple.conf"}
TMP_CONFIG=${TMP_CONFIG:-"$honey/tmp/honey.conf"}

HOST_ARG=${1:-$(echo $DOCKER_HOST | sed 's/tcp:\/\/\(.*\):.*/\1/g')}
HOST_ARG=${HOST_ARG:-'localhost'}
HOST=${ES_HOST:-$HOST_ARG}
PORT_ARG=${2:-9200}
PORT=${ES_PORT:-$PORT_ARG}

echo "************************"
echo "Working with $HOST on port $PORT"
echo "************************"

cat $CONFIG | sed "s#localhost#$HOST:$PORT#g" > $TMP_CONFIG

rm ~/.sincedb*

$lb/logstash -f $TMP_CONFIG
