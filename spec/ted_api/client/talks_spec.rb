require 'spec_helper'

describe TedApi::Client::Talks do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list Ted talks in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("talks.json?api-key=foo").
      to_return(:body => fixture("talks.json"))
    response = @client.talks
    expect(response.talks.first.talk.name).to eq("Al Gore: Averting the climate crisis" )
  end 
  
  it "should return Ted talks in json raw" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("talks.json?api-key=foo").
      to_return(:body => fixture("talks.json"))
    response = @client.talks(nil, {}, true)
    expect(response.class.name).to eq("Faraday::Response" )
  end
  
  it "should return a specific Ted talk in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("talks/1.json?api-key=foo").
      to_return(:body => fixture("talk.json"))
    response = @client.talks('1')
    expect(response.talk.name).to eq("Al Gore: Averting the climate crisis" )
  end 
  
  it "should return speakers for a specific Ted talk in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("talks/1/speakers.json?api-key=foo").
      to_return(:body => fixture("speakers_by_talk.json"))
    response = @client.speakers_by_talk('1')
    expect(response.speakers.first.speaker.description).to eq('Climate-change prophet')
  end
  
  it "should return speakers for a specific Ted talk in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("talks/1/subtitles.json?api-key=foo").
      to_return(:body => fixture("subtitles.json"))
    response = @client.subtitles('1')
    expect(response.first.first).to eq("0")
  end
  
  # XML Tests:
  
  it "should list Ted talks in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("talks.xml?api-key=foo").
      to_return(:body => fixture("talks.xml"))
    response = @client.talks
    expect(response.talks.talk.first.name).to eq("Al Gore: Averting the climate crisis" )
  end
  
  it "should return Ted talks in xml raw" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("talks.xml?api-key=foo").
      to_return(:body => fixture("talks.xml"))
    response = @client.talks(nil, {}, true)
    expect(response.class.name).to eq("Faraday::Response" )
  end
  
  it "should return a specific Ted talk in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("talks/1.xml?api-key=foo").
      to_return(:body => fixture("talk.xml"))
    response = @client.talks('1')
    expect(response.talk.name).to eq("Al Gore: Averting the climate crisis" )
  end
  
  
end