#!/bin/bash

set -eu

sudo yum -y install rbenv

gem install bundle

bundle install

npm install

bundle exec rake db:reset
