module Voog
  class API

    # Voog Layouts API methods.
    #
    # @see http://www.voog.com/developers/api/resources/layouts
    module Layouts

      # List layouts
      #
      # @see http://www.voog.com/developers/api/resources/layouts#get_layouts
      def layouts(params = {})
        paginate 'layouts', {query: params}
      end

      # Get a single layout
      #
      # @see http://www.voog.com/developers/api/resources/layouts#get_layout
      def layout(id, params = {})
        get "layouts/#{id}", {query: params}
      end

      # Create a layout
      #
      # @see http://www.voog.com/developers/api/resources/layouts#create_layout
      def create_layout(data)
        post 'layouts', data
      end

      # Update a layout
      #
      # @see http://www.voog.com/developers/api/resources/layouts#update_layout
      def update_layout(id, data)
        put "layouts/#{id}", data
      end

      # Delete a layout
      #
      # @see http://www.voog.com/developers/api/resources/layouts#remove_layout
      def delete_layout(id)
        delete "layouts/#{id}"
      end
    end
  end
end
