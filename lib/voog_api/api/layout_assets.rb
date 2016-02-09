module Voog
  class API
    module LayoutAssets
      
      # List layouts assets
      def layout_assets(params = {})
        paginate 'layout_assets', {query: params}
      end

      # Get a single layout asset
      def layout_asset(id, params = {})
        get "layout_assets/#{id}", {query: params}
      end

      # Create a layout asset
      def create_layout_asset(data)
        if data && data.key?(:file)
          data = data.dup
          data[:file] = Faraday::UploadIO.new(data[:file], data[:content_type])
          options = {multipart: true}
        end

        post 'layout_assets', data, (options || {})
      end

      # Update a layout asset
      def update_layout_asset(id, data)
        if data && data.key?(:file)
          data[:data] = File.read data.delete(:file)
        end
        put "layout_assets/#{id}", data
      end

      # Delete a layout asset
      def delete_layout_asset(id)
        delete "layout_assets/#{id}"
      end
    end
  end
end
