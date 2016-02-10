module Voog
  class API

    # Voog Media Sets API methods.
    #
    # @see http://www.voog.com/developers/api/resources/media_sets
    module MediaSets

      # List media_sets
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#get_media_sets
      def media_sets(params = {})
        paginate 'media_sets', {query: params}
      end

      # Get a single media_set
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#get_media_set
      def media_set(id, params = {})
        get "media_sets/#{id}", {query: params}
      end

      # Create a media_set
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#create_media_set
      def create_media_set(data)
        post 'media_sets', data
      end

      # Update a media_set
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#update_media_set
      def update_media_set(id, data)
        put "media_sets/#{id}", data
      end

      # Delete a media_set
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#remove_media_set
      def delete_media_set(id)
        delete "media_sets/#{id}"
      end

      # Add assets to media_set
      #
      # @see http://www.voog.com/developers/api/resources/media_sets#add_asset_to_media_set
      def media_set_add_assets(media_set_id, data)
        post "media_sets/#{media_set_id}/add_assets", data
      end
    end
  end
end
