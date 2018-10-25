#!/bin/bash
#
# update repos
sudo apt update
#
# install ruby
sudo apt install -y ruby-full ruby-bundler build-essential
#
# add MongoDB repo keys
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#
# add MongoDB repo
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
#
# update apt repos
sudo apt update
#
# install MongoDB
sudo apt install -y mongodb-org
#
# start MongoDB
sudo systemctl start mongod
#
# enable MongDB autostart
sudo systemctl enable mongod
#
# clone app code
git clone -b monolith https://github.com/express42/reddit.git
#
# install dependencies
cd reddit && bundle install
#
# start app server
puma -d

