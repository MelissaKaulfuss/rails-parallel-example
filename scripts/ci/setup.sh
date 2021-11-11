#!/bin/bash

set -eu

sudo yum install -y git gcc make readline-devel openssl-devel

git clone git://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build system-widely
git clone git://github.com/rbenv/ruby-build.git /tmp/ruby-build
cd /tmp/ruby-build
sudo ./install.sh

rbenv install 2.4.1 && rbenv global 2.4.1

gem install bundle

bundle install

npm install

bundle exec rake db:reset
