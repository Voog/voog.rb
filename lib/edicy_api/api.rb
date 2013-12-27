module Edicy
  
  class API
    
    API_PATH = '/admin/api'.freeze

    module Requests

      def get(url, options = {})
        @api[url].get(api_header.merge(options))
      end

      def post(url, data, options = {})
        @api[url].post(data, api_header.merge(options))
      end

      def put(url, data, options = {})
        @api[url].put(data, api_header.merge(options))
      end

      def delete(url, options = {})
        @api[url].delete(api_header.merge(options))
      end
    end
  end
end
