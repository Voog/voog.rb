module Voog
  class API
    module Assets

      # List assets
      def assets(params = {})
        paginate 'assets', {query: params}
      end

      # Get a single asset
      def asset(id, params = {})
        get "assets/#{id}", {query: params}
      end

      # Create a asset
      def create_asset(data)
        post 'assets', data
      end

      # Confirm a asset upload
      def confirm_asset(id)
        put "assets/#{id}/confirm", nil
      end

      # Delete a asset
      def delete_asset(id)
        delete "assets/#{id}"
      end
    end
  end
end
