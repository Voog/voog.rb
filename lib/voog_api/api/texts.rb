module Voog
  class API
    module Texts

      # List text contents
      def texts(params = {})
        paginate 'texts', {query: params}
      end

      # Get a single text content
      def text(id, params = {})
        get "texts/#{id}", {query: params}
      end

      # Update a text content
      def update_text(id, data)
        put "texts/#{id}", data
      end
    end
  end
end
