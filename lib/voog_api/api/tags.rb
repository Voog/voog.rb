module Voog
  class API
    module Tags

      # List tags
      def tags(params = {})
        get 'tags', {query: params}
      end

      # Get a single tag
      def tag(id, params = {})
        get "tags/#{id}", {query: params}
      end

      # Update a tag
      def update_tag(id, data)
        put "tags/#{id}", data
      end

      # Delete a tag
      def delete_tag(id)
        delete "tags/#{id}"
      end
    end
  end
end
