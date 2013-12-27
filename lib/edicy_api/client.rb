require 'edicy_api/api'
require 'edicy_api/api/layouts'
require 'edicy_api/api/layout_assets'
require 'ostruct'

module Edicy
  class Client
    
    include Edicy::API::Requests
    include Edicy::API::Layouts
    include Edicy::API::LayoutAssets

    attr_reader :api_token, :site

    def initialize(site = Edicy.site, api_token = Edicy.api_token, options = {})
      @site = site
      @api_token = api_token
      @api = RestClient::Resource.new("#{site}#{Edicy::API::API_PATH}") 
      @options = options
    end

    def api_header
      {"X-API-TOKEN" => @api_token}
    end

    def hash2openstruct(hash)
      if hash.is_a?(Hash)
        OpenStruct.new(hash.keys.each_with_object({}) { |e, h| 
          h[e] = hash2openstruct(hash[e]) 
        })
      else
        hash
      end
    end
  end
end
