require 'sawyer'

require 'edicy_api/api/layouts'
require 'edicy_api/api/layout_assets'
require 'edicy_api/api/site'
require 'edicy_api/api/pages'
require 'edicy_api/api/tags'

module Edicy
  
  class Client
    
    include Edicy::API::Layouts
    include Edicy::API::LayoutAssets
    include Edicy::API::Site
    include Edicy::API::Pages
    include Edicy::API::Tags

    attr_reader :api_token, :site

    def initialize(site = Edicy.site, api_token = Edicy.api_token, options = {})
      @site = site
      @api_token = api_token
      @options = options
    end

    def get(url, options = {})
      request :get, url, options
    end
    
    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def patch(url, options = {})
      request :patch, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    def head(url, options = {})
      request :head, url, options
    end
    
    def api_endpoint
      "http://#{site}"
    end
    
    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:accept] = 'application/json'
        http.headers[:content_type] = 'application/json'
        http.headers[:user_agent] = 'Edicy.rb Ruby wrapper'
        http.headers[:x_api_token] = @api_token
      end
    end
    
    def last_response
      @last_response
    end
    
    private
    
    def request(method, path, data, options = {})
      path = "/admin/api/#{path}"

      @last_response = response = agent.call(method, URI.encode(path.to_s), data, options)
      response.data
    end
    
    def sawyer_options
      opts = {
        faraday: Faraday.new
      }

      opts
    end
  end
end
