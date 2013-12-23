require 'edicy_api/version'
require 'edicy_api/client'
require 'rest-client'

module Edicy

  class << self
    attr_accessor :site, :api_token

    def client(options={})
      unless site.nil? && api_token.nil?
        @client ||= Edicy::Client.new(site, api_token, options)
      else
        @client = nil
      end
      @client
    end

    def api
      unless @site.nil?
        @api ||= RestClient::Resource.new("#{site}#{Edicy::API::API_PATH}") 
      else 
        nil 
      end
    end

    def site=(s)
      @site = s
      @api = api
    end

    def configure
      yield self
      true
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"

    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
