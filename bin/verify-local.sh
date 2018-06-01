#!/bin/bash

# ps aux | grep sense | tail -1 | awk '{ print $2 }' | xargs kill

set -e

source ./test-build/bin/activate

VERSION=`cat ./VERSION`
pip install dist/sense12-${VERSION}.tar.gz


PORT=1081
# START THE SERVER
sense12 start-server --port ${PORT} &
PID=$!
echo $PID
# WAIT for 3 seconds
sleep 3
set +e
# VERIFY /health endpoint
curl -fv http://127.0.0.1:1081/v1/health
RESULT=$?
set -e
echo "Curl returned with exit ${RESULT}"
echo "Server still running?"
kill -0 $PID
echo "Cleaning up"
kill ${PID}
exit $RESULT
