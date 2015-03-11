# -*- encoding: utf-8 -*-
require 'spec_helper'

describe TedApi do
  after do
    TedApi.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      expect(TedApi.respond_to?(:new, true)).to be
    end
  end

  describe ".new" do
    it "should be a TedApi::Client" do
      expect(TedApi.new).to be_instance_of(TedApi::Client)
    end
  end

end
