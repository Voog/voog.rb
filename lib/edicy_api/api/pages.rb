module Edicy
  class API
    module Pages

      # List pages
      def pages(params = {})
        get 'pages', {query: params}
      end

      # Get a single page
      def page(id, params = {})
        get "pages/#{id}", {query: params}
      end
      
      # Create a page
      def create_page(data)
        post 'pages', data
      end

      # Update a page
      def update_page(id, data)
        put "pages/#{id}", data
      end

      # Delete a page
      def delete_page(id)
        delete "pages/#{id}"
      end

      # Update/create a key in page data field
      #
      # @params id [String] key in data field
      def update_page_data(page_id, id, data)
        put "pages/#{page_id}/data/#{id}", {value: data}
      end

      # Delete a key from page data field
      #
      # @params id [String] key in data field
      def delete_page_data(page_id, id)
        delete "pages/#{page_id}/data/#{id}"
      end
    end
  end
end
