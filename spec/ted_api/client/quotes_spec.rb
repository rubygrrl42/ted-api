require 'spec_helper'

describe TedApi::Client::Quotes do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list Ted quotes in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("quotes.json?api-key=foo").
      to_return(:body => fixture("quotes.json"))
    response = @client.quotes
    expect(response.quotes.first.quote.slug).to eq('around_the_world_women_and_children_spend_40_billion_hours')
  end 
  
  it "should return a specific Ted quote in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("quotes/1.json?api-key=foo").
      to_return(:body => fixture("quote.json"))
    response = @client.quotes('1')
    expect(response.quote.slug).to eq('around_the_world_women_and_children_spend_40_billion_hours')
  end 
  
  # XML Tests:
  
  it "should list Ted events in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("quotes.xml?api-key=foo").
      to_return(:body => fixture("quotes.xml"))
    response = @client.quotes
    expect(response.quotes.first.first).to eq('quote')
  end
  
  it "should return a specific Ted event in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("quotes/1.xml?api-key=foo").
      to_return(:body => fixture("quote.xml"))
    response = @client.quotes('1')
    expect(response.quote.slug).to eq('around_the_world_women_and_children_spend_40_billion_hours')
  end
  
  
end