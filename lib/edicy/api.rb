module Edicy
  class API
    API_PATH = '/admin/api'.freeze

    module Requests

      def get(url, options = {})
        @api[url].get(Edicy.client.api_header.merge(options))
      end

      def post(url, data, options = {})
        @api[url].post(data, Edicy.client.api_header.merge(options))
      end

      def put(url, data, options = {})
        @api[url].put(data, Edicy.client.api_header.merge(options))
      end

      def delete(url, options = {})
        @api[url].delete(Edicy.client.api_header.merge(options))
      end

    end
  
  end
end
