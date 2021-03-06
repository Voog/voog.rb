module Voog
  class API

    # Voog Assets API methods.
    #
    # @see http://www.voog.com/developers/api/resources/assets
    module Assets

      # List assets
      #
      # @see http://www.voog.com/developers/api/resources/assets#get_assets
      def assets(params = {})
        paginate 'assets', {query: params}
      end

      # Get a single asset
      #
      # @see http://www.voog.com/developers/api/resources/assets#get_asset
      def asset(id, params = {})
        get "assets/#{id}", {query: params}
      end

      # Create an asset
      #
      # @see http://www.voog.com/developers/api/resources/assets#create_asset
      def create_asset(data)
        post 'assets', data
      end

      # Confirm an asset upload
      #
      # @see http://www.voog.com/developers/api/resources/assets#confirm_asset
      def confirm_asset(id, params = {})
        put "assets/#{id}/confirm", params
      end

      # Delete an asset
      #
      # @see http://www.voog.com/developers/api/resources/assets#remove_asset
      def delete_asset(id)
        delete "assets/#{id}"
      end
    end
  end
end
