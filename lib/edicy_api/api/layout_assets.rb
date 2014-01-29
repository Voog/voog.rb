module Edicy
  class API
    module LayoutAssets
      
      # List layouts assets
      def layout_assets(params = {})
        get 'layout_assets', {query: params}
      end

      # Get a single layout asset
      def layout_asset(id, params = {})
        get "layout_assets/#{id}", {query: params}
      end

      # Create a layout asset
      def create_layout_asset(data)
        post 'layout_assets', data
      end

      # Update a layout asset
      def update_layout_asset(id, data)
        put "layout_assets/#{id}", data
      end

      # Delete a layout asset
      def delete_layout_asset(id)
        delete "layout_assets/#{id}"
      end
    end
  end
end
