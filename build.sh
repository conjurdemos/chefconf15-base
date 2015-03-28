#!/bin/bash -e

berks vendor .vendor

docker build -t foundation .
docker tag -f foundation conjurdemos/chefconf15-foundation
