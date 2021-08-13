#!/bin/bash

set -eu

gem install bundle

bundle install

npm install

bundle exec rake db:reset
