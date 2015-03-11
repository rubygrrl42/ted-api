require 'spec_helper'

describe TedApi::Client do
  it 'should instantiate with api key' do
    expect{proc {
      TedApi::Client.new(api_key: 'foo')
    }}.to_not raise_exception
  end

  describe "api_endpoint" do
    after(:each) do
      TedApi.reset
    end

    it "should default to https://api.ted.com/" do
      client = TedApi::Client.new
      expect(client.api_endpoint).to eq('https://api.ted.com/')
    end

    it "should be set " do
      TedApi.api_endpoint = 'http://foo.dev'
      client = TedApi::Client.new
      expect(client.api_endpoint).to eq('http://foo.dev/')
    end
  end
end