module Voog
  class API
    module Site

      # Get site attributes
      def site(params = {})
        get 'site', {query: params}
      end

      # Update a site
      def update_site(data)
        put "site", data
      end

      # Patch a site
      def patch_site(data)
        patch "site", data
      end

      # Update/create a key in site data field
      #
      # @param id [String] key in data field
      def update_site_data(id, data)
        put "site/data/#{id}", {value: data}
      end

      # Delete a key from site data field
      #
      # @param id [String] key in data field
      def delete_site_data(id)
        delete "site/data/#{id}"
      end
    end
  end
end
