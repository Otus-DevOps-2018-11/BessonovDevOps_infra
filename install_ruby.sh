#!/bin/bash

set -e
apt-get update && apt-get upgrade -y
apt-get install -y ruby-full ruby-bundler build-essential
