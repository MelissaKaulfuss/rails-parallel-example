require 'spec_helper'
require 'net/http'

RSpec.describe "Third spec" do
  describe "Wait wait wait" do
    it "Wastes my time." do
      sleep 4
    end

    it "Sloooowwww" do
      sleep 24
    end
  end
end
