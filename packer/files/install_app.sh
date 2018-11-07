#!/bin/bash
#
# clone app code
git clone -b monolith https://github.com/express42/reddit.git
#
# install dependencies
cd reddit
bundle install
