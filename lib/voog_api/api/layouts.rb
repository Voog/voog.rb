module Voog
  class API
    module Layouts

      # List layouts
      def layouts(params = {})
        get 'layouts', {query: params}
      end

      # Get a single layout
      def layout(id, params = {})
        get "layouts/#{id}", {query: params}
      end

      # Create a layout
      def create_layout(data)
        post 'layouts', data
      end

      # Update a layout
      def update_layout(id, data)
        put "layouts/#{id}", data
      end

      # Delete a layout
      def delete_layout(id)
        delete "layouts/#{id}"
      end
    end
  end
end
