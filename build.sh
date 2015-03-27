#!/bin/bash

set -e

berks vendor .vendor

docker build -t foundation .

rm -rf .vendor