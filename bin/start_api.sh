#!/bin/bash

set -e

PORT=1029
sense12 start-api --http-port ${PORT} &
PID=$!
echo "Started server PID: ${PID}" >&2
echo $PID
