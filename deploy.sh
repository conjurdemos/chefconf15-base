#!/bin/bash
set -e

berks vendor .vendor

knife cookbook upload --all -o .vendor

rm -rf .vendor
