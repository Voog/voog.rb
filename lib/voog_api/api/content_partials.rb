module Voog
  class API
    module ContentPartials

      # List content partials contents
      def content_partials(params = {})
        get 'content_partials', {query: params}
      end

      # Get a single content partial content
      def content_partial(id, params = {})
        get "content_partials/#{id}", {query: params}
      end

      # Update a content partial content
      def update_content_partial(id, data)
        put "content_partials/#{id}", data
      end
    end
  end
end
