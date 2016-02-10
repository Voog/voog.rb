module Voog
  class API

    # Voog Layout Assets API methods.
    #
    # @see http://www.voog.com/developers/api/resources/layout_assets
    module LayoutAssets
      
      # List layouts assets
      #
      # @see http://www.voog.com/developers/api/resources/layout_assets#get_layout_assets
      def layout_assets(params = {})
        paginate 'layout_assets', {query: params}
      end

      # Get a single layout asset
      #
      # @see http://www.voog.com/developers/api/resources/layout_assets#get_layout_asset
      def layout_asset(id, params = {})
        get "layout_assets/#{id}", {query: params}
      end

      # Create a layout asset
      #
      # @option data [String] :data file content (used text based files only - e. g. .css, .js)
      # @option data [String] :file path to file location (used for binary files only)
      # @see http://www.voog.com/developers/api/resources/layout_assets#create_layout_asset
      def create_layout_asset(data)
        if data && data.key?(:file)
          data = data.dup
          data[:file] = Faraday::UploadIO.new(data[:file], data[:content_type])
          options = {multipart: true}
        end

        post 'layout_assets', data, (options || {})
      end

      # Update a layout asset
      #
      # @see http://www.voog.com/developers/api/resources/layout_assets#update_layout_asset
      def update_layout_asset(id, data)
        if data && data.key?(:file)
          data[:data] = File.read data.delete(:file)
        end
        put "layout_assets/#{id}", data
      end

      # Delete a layout asset
      #
      # @see http://www.voog.com/developers/api/resources/layout_assets#remove_layout_asset
      def delete_layout_asset(id)
        delete "layout_assets/#{id}"
      end
    end
  end
end
