require 'edicy/api'
require 'edicy/api/layouts'
require 'edicy/api/layout_assets'
require 'ostruct'

module Edicy
  class Client
    
    include Edicy::API::Requests
    include Edicy::API::Layouts
    include Edicy::API::LayoutAssets

    attr_reader :api_token, :site

    def initialize( site=Edicy.site, api_token=Edicy.api_token, options={} )
      @site = site
      @api_token = api_token
      @api = Edicy.api
      @options = options
    end

    def api_header
      { "X-API-TOKEN" => @api_token }
    end

    def h2o(hash)
      hash.is_a?(Hash) ?
        OpenStruct.new(hash.keys.each_with_object({}) { |e, h| 
          h[e] = h2o(hash[e]) 
        }) :
        hash
    end

  end
end
