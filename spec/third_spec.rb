require 'spec_helper'
require 'net/http'

RSpec.describe "Third spec" do
  describe "GET" do
    it "returns 'Hello World'" do
      get Net::HTTP.get(URI.parse('http://www.google.com'))


      expect(response.status).to eql(200)
    end
  end
end