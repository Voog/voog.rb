require 'edicy_api/version'
require 'edicy_api/client'

module Edicy

  class << self
    
    attr_accessor :site, :api_token

    def client(options = {})
      unless site.nil? && api_token.nil?
        Edicy::Client.new(site, api_token, options)
      else
        nil
      end
    end

    def configure
      yield self
      true
    end

    if RUBY_VERSION >= '1.9'
      
      def respond_to_missing?(method_name, include_private = false)
        client.respond_to?(method_name, include_private)
      end
      
    end

    if RUBY_VERSION < '1.9'
      
      def respond_to?(method_name, include_private = false)
        client.respond_to?(method_name, include_private) || super
      end
      
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
