require 'spec_helper'

describe TedApi::Client::Tags do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list tags in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("tags.json?api-key=foo").
      to_return(:body => fixture("tags.json"))
    response = @client.tags
    expect(response.tags.first.tag.name).to eq('standard')
  end 
  
  it "should return a specific tag in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("tags/1.json?api-key=foo").
      to_return(:body => fixture("tag.json"))
    response = @client.tags('1')
    expect(response.tag.name).to eq('standard')
  end 
  
  # XML Tests:
  
  it "should list speakers in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("tags.xml?api-key=foo").
      to_return(:body => fixture("tags.xml"))
    response = @client.tags
    expect(response.tags.first.first).to eq('tag')
  end
  
  it "should return a specific theme in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("tags/1.xml?api-key=foo").
      to_return(:body => fixture("tag.xml"))
    response = @client.tags('1')
    expect(response.tag.name).to eq('standard')
  end
  
  
end