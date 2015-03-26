#!/bin/bash

#!/bin/bash
set -e

berks vendor .vendor/cookbooks

mkdir -p vendor/cookbooks/foundation
cp -R metadata.rb Berksfile Berksfile.lock attributes recipes .vendor/cookbooks/foundation
version=`git describe --tags --abbrev=0`
cd .vendor
tarball="foundation-${version}.tar.gz"
echo "Building cookbook tarball ${tarball}"
tar czf ../${tarball} cookbooks

rm -rf .vendor
