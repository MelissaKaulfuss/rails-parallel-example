require 'spec_helper'

require 'knapsack'

require "rspec/buildkite/insights"

Knapsack::Adapters::RSpecAdapter.bind

RSpec::Buildkite::Insights.configure do |config|
    # defaults, baby!
end