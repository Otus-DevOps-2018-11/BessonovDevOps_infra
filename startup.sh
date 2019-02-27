#!/bin/bash

# use sudo to run script
apt-get update && apt-get upgrade -y && \
apt-get install -y ruby-full ruby-bundler build-essential
gem install bundler

# use sudo to run script
apt-get-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

mongo_apt="/etc/apt-get/sources.list.d/mongodb-org-3.2.list"

if [ ! -f $mongo_apt-get ]
then
	echo "deb http://repo.mongodb.org/apt-get/ubuntu $(lsb_release -cs)/mongodb-org/3.2 multiverse" \
	> $mongo_apt
fi
apt-get update
apt-get install -y mongodb-org && \
systemctl enable mongod && \
systemctl start mongod

cd ~
git clone -b monolith https://github.com/express42/reddit.git && \
cd reddit && bundle install && \
puma -d
