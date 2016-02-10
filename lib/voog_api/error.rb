module Voog

  # Raised when Voog API returns a 301 HTTP status code
  class MovedPermanently < StandardError
    attr_reader :response

    def initialize(response, hostname)
      @response = response
      super("#{hostname} is permanently redirected to #{response.headers['location'] if response}")
    end
  end

end
