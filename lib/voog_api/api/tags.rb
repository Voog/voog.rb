module Voog
  class API

    # Voog Tags API methods.
    #
    # @see http://www.voog.com/developers/api/resources/tags
    module Tags

      # List tags
      #
      # @see http://www.voog.com/developers/api/resources/tags#get_tags
      def tags(params = {})
        paginate 'tags', {query: params}
      end

      # Get a single tag
      #
      # @see http://www.voog.com/developers/api/resources/tags#get_tag
      def tag(id, params = {})
        get "tags/#{id}", {query: params}
      end

      # Update a tag
      #
      # @see http://www.voog.com/developers/api/resources/tags#update_tag
      def update_tag(id, data)
        put "tags/#{id}", data
      end

      # Delete a tag
      #
      # @see http://www.voog.com/developers/api/resources/tags#remove_tag
      def delete_tag(id)
        delete "tags/#{id}"
      end
    end
  end
end
