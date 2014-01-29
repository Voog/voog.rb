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

      # Page contents

      # List contents for page
      def page_contents(id, params = {})
        contents(Edicy::API::Contents::ParentKind::Page, id, params)
      end

      # Get a single content for page
      def page_content(page_id, id, params = {})
        content(Edicy::API::Contents::ParentKind::Page, page_id, id, params)
      end

      # Create a page content for page
      def create_page_content(page_id, data)
        create_content(Edicy::API::Contents::ParentKind::Page, page_id, data)
      end

      # Delete a content from page
      def delete_page_content(page_id, id)
        delete_content(Edicy::API::Contents::ParentKind::Page, page_id, id)
      end

      # Reorder/move page content inside/between content areas and parent objects
      def move_page_content(page_id, id, params = {})
        move_content(Edicy::API::Contents::ParentKind::Page, page_id, id, params)
      end
    end
  end
end
