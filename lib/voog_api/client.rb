require 'json'
require 'sawyer'

require 'voog_api/api/articles'
require 'voog_api/api/assets'
require 'voog_api/api/comments'
require 'voog_api/api/content_partials'
require 'voog_api/api/contents'
require 'voog_api/api/element_definitions'
require 'voog_api/api/elements'
require 'voog_api/api/forms'
require 'voog_api/api/languages'
require 'voog_api/api/layouts'
require 'voog_api/api/layout_assets'
require 'voog_api/api/media_sets'
require 'voog_api/api/nodes'
require 'voog_api/api/site'
require 'voog_api/api/pages'
require 'voog_api/api/people'
require 'voog_api/api/tags'
require 'voog_api/api/texts'
require 'voog_api/api/tickets'

module Voog
  
  class Client
    
    include Voog::API::Articles
    include Voog::API::Assets
    include Voog::API::Comments
    include Voog::API::ContentPartials
    include Voog::API::Contents
    include Voog::API::ElementDefinitions
    include Voog::API::Elements
    include Voog::API::Forms
    include Voog::API::Languages
    include Voog::API::Layouts
    include Voog::API::LayoutAssets
    include Voog::API::MediaSets
    include Voog::API::Nodes
    include Voog::API::Pages
    include Voog::API::People
    include Voog::API::Site
    include Voog::API::Tags
    include Voog::API::Texts
    include Voog::API::Tickets

    attr_reader :api_token, :host

    # Initialize Voog API client.
    #
    # @param host [String] a Voog site host.
    # @param api_token [String] a Voog site API token.
    # @option options [String] :protocol endpoint protocol ("http" or "https"). Defaults to "http".
    # @option options [Boolean] :raise_on_error interrupts program with error ("Faraday::Error") when request response code is between "400" and "600" (default is "false").
    # @example Initialize client
    #   client = Voog::Client.new('example.com', 'afcf30182aecfc8155d390d7d4552d14', protocol: :http, raise_on_error: false)
    def initialize(host = Voog.host, api_token = Voog.api_token, options = {})
      @host = host
      @api_token = api_token
      @options = options
      @protocol = options[:protocol].to_s.downcase == 'https' ? 'https' : 'http'
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
      "#{@protocol}://#{host}/admin/api"
    end
    
    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:content_type] = 'application/json'
        http.headers[:accept] = 'application/json'
        http.headers[:user_agent] = 'Voog.rb Ruby wrapper'
        http.headers[:x_api_token] = @api_token
      end
    end

    def multipart_agent
      Faraday.new do |faraday|
        faraday.request :multipart
        faraday.response :raise_error if @raise_on_error
        faraday.adapter :net_http

        faraday.headers['X_API_TOKEN'] = @api_token
        faraday.headers['User-Agent'] = 'Voog.rb Ruby wrapper'
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
