require 'spec_helper'

require 'knapsack'

Knapsack::Adapters::RSpecAdapter.bind

RSpec::Buildkite::Insights.configure do |config|
    config.suite_key = "siMRUdHe229TkvtqioGRL1Ah"
    # This is absolutely a secure and good way to do things.
  end
