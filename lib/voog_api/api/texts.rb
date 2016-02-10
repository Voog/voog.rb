module Voog
  class API

    # Voog Text Contents API methods.
    #
    # @see http://www.voog.com/developers/api/resources/texts
    module Texts

      # List text contents
      #
      # @see http://www.voog.com/developers/api/resources/texts#get_texts
      def texts(params = {})
        paginate 'texts', {query: params}
      end

      # Get a single text content
      #
      # @see http://www.voog.com/developers/api/resources/texts#get_text
      def text(id, params = {})
        get "texts/#{id}", {query: params}
      end

      # Update a text content
      #
      # @see http://www.voog.com/developers/api/resources/texts#update_text
      def update_text(id, data)
        put "texts/#{id}", data
      end
    end
  end
end
