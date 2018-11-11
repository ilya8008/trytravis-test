#!/bin/bash
#
# add MongoDB repo keys
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#
# add MongoDB repo
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
#
# update apt repos
apt update
#
# install MongoDB
apt install -y mongodb-org
#
# modify config file
sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
#
# start MongoDB
systemctl start mongod
#
# enable MongDB autostart
systemctl enable mongod
