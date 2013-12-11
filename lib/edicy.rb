require 'rest-client'

module Edicy

  class << self
    attr_accessor :api_token, :site

    def api_url
      @api_url ||= RestClient::Resource.new("#{site}#{Edicy::API::API_PATH}") unless @site.nil?
    end

    def site=(s)
      @site = s
      @api_url = api_url
    end

    def configure
      yield self
      true
    end
  end

  autoload :Version, "./edicy/version"
  autoload :API, "./edicy/api"
  autoload :Request, "./edicy/request"

end
