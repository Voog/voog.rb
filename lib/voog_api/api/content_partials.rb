module Voog
  class API

    # Voog Content Partials API methods.
    #
    # @see http://www.voog.com/developers/api/resources/content_partials
    module ContentPartials

      # List content partials contents
      #
      # @see http://www.voog.com/developers/api/resources/content_partials#get_content_partials
      def content_partials(params = {})
        paginate 'content_partials', {query: params}
      end

      # Get a single content partial content
      #
      # @see http://www.voog.com/developers/api/resources/content_partials#get_content_partial
      def content_partial(id, params = {})
        get "content_partials/#{id}", {query: params}
      end

      # Update a content partial content
      #
      # @see http://www.voog.com/developers/api/resources/content_partials#update_content_partial
      def update_content_partial(id, data)
        put "content_partials/#{id}", data
      end
    end
  end
end
