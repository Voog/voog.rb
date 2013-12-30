module Edicy
  class API
    module LayoutAssets
      
      def layout_assets
        get "layout_assets"
      end

      def layout_asset(id)
        get "layout_assets/#{id}"
      end

      def create_layout_asset(data)
        post "layout_assets", data
      end

      def update_layout_asset(id, data)
        put "layout_assets/#{id}", data
      end

      def delete_layout_asset(id)
        delete "layout_assets/#{id}"
      end
    end
  end
end
