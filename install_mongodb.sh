#!/bin/bash

# use sudo to run script
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

mongo_apt="/etc/apt/sources.list.d/mongodb-org-3.2.list"

if [ ! -f $mongo_apt ]
then
	echo "deb http://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/3.2 multiverse" \
	> $mongo_apt
fi
apt-get update && \ 
apt-get install -y mongodb-org && \
systemctl enable mongod && \
systemctl start mongod

