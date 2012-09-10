require 'ted_api/connection'
require 'ted_api/request'
require 'ted_api/error'

require 'ted_api/client/talks'
require 'ted_api/client/events'
require 'ted_api/client/languages'

module TedApi
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = TedApi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    include TedApi::Connection
    include TedApi::Request
    include TedApi::Client::Talks
    include TedApi::Client::Events
    include TedApi::Client::Languages
    
  end
end