require 'voog_api/version'
require 'voog_api/client'

module Voog

  class << self
    
    attr_accessor :host, :api_token

    def client(options = {})
      unless host.nil? && api_token.nil?
        Voog::Client.new(host, api_token, options)
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
