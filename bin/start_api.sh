#!/bin/bash

set -e

PORT=${API_PORT:-1029}
sense12 --port ${PORT} &
PID=$!
# echo "Started server PID: ${PID}" >&2
echo $PID
