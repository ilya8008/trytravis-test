#!/bin/bash
set -e

APP_DIR=$HOME
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo sed -i "s/Environment=/Environment=DATABASE_URL=${1}/" /etc/systemd/system/puma.service
sudo systemctl enable puma
sudo systemctl start puma
