#!/bin/ash

rc-service nginx start
cd /app
bin/setup
bundle exec pumactl start
