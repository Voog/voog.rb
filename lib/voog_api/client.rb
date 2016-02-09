require 'json'
require 'sawyer'

require 'voog_api/middleware/follow_redirects'
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

    MAX_PER_PAGE = 250

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

    attr_reader :api_token, :host, :auto_paginate, :per_page

    # Initialize Voog API client.
    #
    # @param host [String] a Voog site host.
    # @param api_token [String] a Voog site API token.
    # @option options [String] :protocol endpoint protocol ("http" or "https"). Defaults to "http".
    # @option options [String] :auto_paginate enable auto pagination for list requests. Defaults to "false".
    # @option options [String] :per_page set default "per_page" value for list requests. Defaults to "nil".
    # @option options [Boolean] :raise_on_error interrupts program with error ("Faraday::Error") when request response code is between "400" and "600" (default is "false").
    # @example Initialize client
    #   client = Voog::Client.new('example.com', 'afcf30182aecfc8155d390d7d4552d14', protocol: :http, raise_on_error: false)
    def initialize(host = Voog.host, api_token = Voog.api_token, options = {})
      @host = host
      @api_token = api_token
      @options = options
      @protocol = options[:protocol].to_s.downcase == 'https' ? 'https' : 'http'
      @auto_paginate = options.fetch(:auto_paginate, Voog.auto_paginate)
      @per_page = options.fetch(:per_page, Voog.per_page)
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
      @multipart_agent ||= Faraday.new do |faraday|
        faraday.request :multipart
        faraday.use Voog::Middleware::FollowRedirects
        faraday.response :raise_error if @raise_on_error
        faraday.adapter :net_http

        faraday.headers[:x_api_token] = @api_token
        faraday.headers[:user_agent] = 'Voog.rb Ruby wrapper'
      end
    end
    
    def last_response
      @last_response
    end

    def parse_response(response)
      JSON.parse(response).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    end

    # Fetch all elements for requested API resource when {#auto_paginate} is turned on.
    def paginate(url, options = {}, &block)
      opts = options.dup
      if @auto_paginate || @per_page
        opts[:query][:per_page] ||= @per_page || (@auto_paginate ? MAX_PER_PAGE : nil)
      end

      data = request(:get, url, nil, opts)

      if @auto_paginate
        i = 0
        while @last_response.rels[:next]
          puts "Request: #{i += 1}"
          @last_response = @last_response.rels[:next].get(headers: opts[:headers])
          if block_given?
            yield(data, @last_response)
          else
            data.concat(@last_response.data) if @last_response.data.is_a?(Array)
          end
        end
      end

      data
     end

    private
    
    def request(method, path, data, options = {})
      multipart = options.fetch(:multipart, false) && (method == :post)

      @last_response = response = multipart ? \
        multipart_agent.post("#{api_endpoint}/#{path}", data) : \
        agent.call(method, URI.encode(path.to_s), data, options.dup)
      if multipart
        parse_response(response.body)
      else
        response.data
      end
    end

    def sawyer_options(multipart = false)
      faraday = Faraday.new do |faraday|
        faraday.response :raise_error if @raise_on_error
        faraday.use Voog::Middleware::FollowRedirects
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
