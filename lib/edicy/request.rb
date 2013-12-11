module Edicy
  module Request

    DEFAULT_HEADERS = { "X-API-TOKEN" => Edicy.api_token }

    class << self

      def get(url, options = {})
        Edicy.api_url[url].get(self::DEFAULT_HEADERS.merge(options))
      end

      def post(url, data, options = {})
        Edicy.api_url[url].post(data, self::DEFAULT_HEADERS.merge(options))
      end

      def put(url, data, options = {})
        Edicy.api_url[url].put(data, self::DEFAULT_HEADERS.merge(options))
      end

      def delete(url, options = {})
        Edicy.api_url[url].delete(self::DEFAULT_HEADERS.merge(options))
      end

    end

  end
end
