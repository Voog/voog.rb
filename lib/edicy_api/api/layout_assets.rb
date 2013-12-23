module Edicy
  class API
    module LayoutAssets
      
      def layout_assets
        @layout_assets = JSON.parse(get('layout_assets'))["assets"]
        @layout_assets.map! { |layout_asset| hash2openstruct(layout_asset) }
      rescue RestClient::Exception
        return false
      end

      def layout_asset(id)
        @layout_asset = JSON.parse(get("layout_assets/#{id}"))["asset"]
        hash2openstruct(@layout_asset)
      rescue RestClient::Exception
        return false
      end

      def delete_layout_asset(id)
        delete("layout_assets/#{id}").code == 200
      rescue RestClient::Exception
        return false
      end

      def update_layout_asset(id, data)
        @layout_asset = JSON.parse(
          put("layout_assets/#{id}", 
          JSON.dump({ "asset" => data }))
        )["asset"]
        hash2openstruct(@layout_asset)
      rescue RestClient::Exception
        return false
      end

      def create_layout_asset(data)
        @layout_asset = JSON.parse(post("layout_assets", { "asset" => data }))["asset"]
        hash2openstruct(@layout_asset)
      rescue RestClient::Exception
        return false
      end

    end
  end
end
