# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ted_api/version'

Gem::Specification.new do |gem|
  gem.name          = "ted_api"
  gem.version       = TedApi::VERSION
  gem.authors       = ["John Barton"]
  gem.email         = ["jb@phy5ics.com"]
  gem.description   = %q{A wrapper for the TED Talks API.}
  gem.summary       = %q{A wrapper for the TED Talks API that allows for both JSON and XML methods.  See http://developer.ted.com/ for more information on the API.}
  gem.homepage      = "https://github.com/phy5ics/ted-api"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'faraday', '~> 0.9.1'
  gem.add_dependency 'faraday_middleware', '~> 0.9.1'
  gem.add_dependency 'hashie', '~> 3.4'
  gem.add_dependency 'multi_json', '~> 1.11'
  gem.add_dependency 'multi_xml', '~> 0.5.5'
  
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'maruku'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  
end
