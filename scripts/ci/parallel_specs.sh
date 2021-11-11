#!/bin/bash

set -eu

STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo rspec | sum | cut -f 1 -d \ )

./buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID rspec-tests -- bundle exec rake knapsack:rspec


./buildevents build $BUILDKITE_BUILD_ID $BUILD_START success