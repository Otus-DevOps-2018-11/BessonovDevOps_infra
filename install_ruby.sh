#!/bin/bash

# use sudo to run script
apt update && apt upgrade -y && \
apt install -y ruby-full ruby-bundler build-essential
gem install bundler
