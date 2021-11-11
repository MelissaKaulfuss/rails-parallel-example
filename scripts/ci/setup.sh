#!/bin/bash

set -eu

# Install Steps

STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo install | sum | cut -f 1 -d \ )

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-build-tools -- sudo yum install -y git gcc make readline-devel openssl-devel
./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-npm -- sudo yum install nodejs npm --enablerepo=epel


./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-rbenv -- [ ! -d ~/.rbenv ] && git clone git://github.com/rbenv/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install ruby-build system-widely
./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-rubybuild -- [ ! -d /tmp/ruby-build ] && git clone git://github.com/rbenv/ruby-build.git /tmp/ruby-build && sudo /tmp/ruby-build/install.sh

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-ruby -- rbenv install -l

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID install-bundler -- gem install bundle

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID bundle-install -- bundle install

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID npm-install -- npm install

STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo raketasks | sum | cut -f 1 -d \ )

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID rake-db-reset -- bundle exec rake db:reset
