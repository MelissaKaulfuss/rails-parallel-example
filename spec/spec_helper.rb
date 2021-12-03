require 'spec_helper'

require 'knapsack'

require "rspec/buildkite/analytics"

Knapsack::Adapters::RSpecAdapter.bind

RSpec::Buildkite::Analytics.configure do |configure|
    # here! Hi!
end