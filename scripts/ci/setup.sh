#!/bin/bash

set -eu

sudo yum install -y git gcc make readline-devel openssl-devel
sudo yum install nodejs npm --enablerepo=epel


[ ! -d ~/.rbenv ] && git clone git://github.com/rbenv/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install ruby-build system-widely
[ ! -d /tmp/ruby-build ] && git clone git://github.com/rbenv/ruby-build.git /tmp/ruby-build
sudo /tmp/ruby-build/install.sh

rbenv install 2.4.1 && rbenv global 2.4.1

gem install bundle

bundle install

npm install

bundle exec rake db:reset
