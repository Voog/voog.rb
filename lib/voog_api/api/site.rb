module Voog
  class API

    # Voog Site API methods.
    #
    # @see http://www.voog.com/developers/api/resources/site
    module Site

      # Get site attributes
      #
      # @see http://www.voog.com/developers/api/resources/site#get_site
      def site(params = {})
        get 'site', {query: params}
      end

      # Update a site
      #
      # @see http://www.voog.com/developers/api/resources/site#update_sites
      def update_site(data)
        put "site", data
      end

      # Patch a site
      #
      # @see http://www.voog.com/developers/api/resources/site#patch_sites
      def patch_site(data)
        patch "site", data
      end

      # Update/create a key in site data field
      #
      # @param id [String] key in data field
      #
      # @see http://www.voog.com/developers/api/resources/site#update_site_data
      def update_site_data(id, data)
        put "site/data/#{id}", {value: data}
      end

      # Delete a key from site data field
      #
      # @param id [String] key in data field
      #
      # @see http://www.voog.com/developers/api/resources/site#delete_site_data_field
      def delete_site_data(id)
        delete "site/data/#{id}"
      end
    end
  end
end
