require 'edicy/api'
require 'edicy/api/layouts'

module Edicy
  class Client
    
    include Edicy::API::Requests
    include Edicy::API::Layouts

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

  end
end
