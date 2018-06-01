#!/bin/bash

set -ex

VERSION=`cat ./VERSION`

rm -rf test-build/
python3 -m venv ./test-build
source ./test-build/bin/activate
pip install dist/sense12-${VERSION}.tar.gz
