require 'spec_helper'

RSpec.describe "Third spec" do
  describe "GET" do
    it "returns 'Hello World'" do
      get "https://google.com"

      expect(response.status).to eql(200)
    end
  end
end