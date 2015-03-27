#!/bin/bash

chef-solo -c /chef/solo.rb -o foundation::configure
