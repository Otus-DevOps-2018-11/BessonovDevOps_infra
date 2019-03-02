#!/bin/bash

# use sudo to run script
set -e
apt-get update && apt-get upgrade -y
apt-get install -y ruby-full ruby-bundler build-essential
gem install bundler

