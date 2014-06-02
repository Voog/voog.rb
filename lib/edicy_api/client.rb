require 'json'
require 'sawyer'

require 'edicy_api/api/articles'
require 'edicy_api/api/assets'
require 'edicy_api/api/comments'
require 'edicy_api/api/content_partials'
require 'edicy_api/api/contents'
require 'edicy_api/api/element_definitions'
require 'edicy_api/api/elements'
require 'edicy_api/api/forms'
require 'edicy_api/api/languages'
require 'edicy_api/api/layouts'
require 'edicy_api/api/layout_assets'
require 'edicy_api/api/media_sets'
require 'edicy_api/api/nodes'
require 'edicy_api/api/site'
require 'edicy_api/api/pages'
require 'edicy_api/api/people'
require 'edicy_api/api/tags'
require 'edicy_api/api/texts'
require 'edicy_api/api/tickets'

module Edicy
  
  class Client
    
    include Edicy::API::Articles
    include Edicy::API::Assets
    include Edicy::API::Comments
    include Edicy::API::ContentPartials
    include Edicy::API::Contents
    include Edicy::API::ElementDefinitions
    include Edicy::API::Elements
    include Edicy::API::Forms
    include Edicy::API::Languages
    include Edicy::API::Layouts
    include Edicy::API::LayoutAssets
    include Edicy::API::MediaSets
    include Edicy::API::Nodes
    include Edicy::API::Pages
    include Edicy::API::People
    include Edicy::API::Site
    include Edicy::API::Tags
    include Edicy::API::Texts
    include Edicy::API::Tickets

    attr_reader :api_token, :host

    def initialize(host = Edicy.host, api_token = Edicy.api_token, options = {})
      @host = host
      @api_token = api_token
      @options = options
      @raise_on_error = options.fetch(:raise_on_error, true)
    end

    def get(url, options = {})
      request :get, url, nil, options
    end
    
    def post(url, data, options = {})
      request :post, url, data, options
    end

    def put(url, data, options = {})
      request :put, url, data, options
    end

    def patch(url, data, options = {})
      request :patch, url, data, options
    end

    def delete(url, options = {})
      request :delete, url, nil, options
    end

    def head(url, options = {})
      request :head, url, nil, options
    end
    
    def api_endpoint
      "http://#{host}/admin/api"
    end
    
    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:content_type] = 'application/json'
        http.headers[:accept] = 'application/json'
        http.headers[:user_agent] = 'Edicy.rb Ruby wrapper'
        http.headers[:x_api_token] = @api_token
      end
    end

    def multipart_agent
      Faraday.new do |faraday|
        faraday.request :multipart
        faraday.response :raise_error if @raise_on_error
        faraday.adapter :net_http

        faraday.headers['X_API_TOKEN'] = @api_token
        faraday.headers['User-Agent'] = 'Edicy.rb Ruby wrapper'
      end
    end
    
    def last_response
      @last_response
    end

    def parse_response(response)
      JSON.parse(response).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    end
    
    private
    
    def request(method, path, data, options = {})
      multipart = options.fetch(:multipart, false) && (method == :post)

      @last_response = response = multipart ? \
        multipart_agent.post("#{api_endpoint}/#{path}", data) : \
        agent.call(method, URI.encode(path.to_s), data, options)
      if multipart
        parse_response(response.body)
      else
        response.data
      end
    end

    def sawyer_options(multipart = false)
      faraday = Faraday.new do |faraday|
        faraday.response :raise_error if @raise_on_error
        faraday.adapter :net_http
      end
      opts = {
        links_parser: Sawyer::LinkParsers::Simple.new,
        faraday: faraday
      }
      opts
    end
  end
end
