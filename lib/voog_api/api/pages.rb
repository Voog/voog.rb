module Voog
  class API

    # Voog Pages API methods.
    #
    # @see http://www.voog.com/developers/api/resources/pages
    module Pages

      # List pages
      #
      # @see http://www.voog.com/developers/api/resources/pages#get_pages
      def pages(params = {})
        paginate 'pages', {query: params}
      end

      # Get a single page
      #
      # @see http://www.voog.com/developers/api/resources/pages#get_page
      def page(id, params = {})
        get "pages/#{id}", {query: params}
      end

      # Create a page
      #
      # @see http://www.voog.com/developers/api/resources/pages#create_pages
      def create_page(data)
        post 'pages', data
      end

      # Update a page
      #
      # @see http://www.voog.com/developers/api/resources/pages#update_page
      def update_page(id, data)
        put "pages/#{id}", data
      end

      # Patch a page
      #
      # @see http://www.voog.com/developers/api/resources/pages#patch_page
      def patch_page(id, data)
        patch "pages/#{id}", data
      end

      # Delete a page
      #
      # @see http://www.voog.com/developers/api/resources/pages#delete_page
      def delete_page(id)
        delete "pages/#{id}"
      end

      # Update/create a key in page data field
      #
      # @param id [String] key in data field
      #
      # @see http://www.voog.com/developers/api/resources/pages#update_page_data_field
      def update_page_data(page_id, id, data)
        put "pages/#{page_id}/data/#{id}", {value: data}
      end

      # Delete a key from page data field
      #
      # @param id [String] key in data field
      #
      # @see http://www.voog.com/developers/api/resources/pages#delete_page_data_field
      def delete_page_data(page_id, id)
        delete "pages/#{page_id}/data/#{id}"
      end

      # Page contents

      # List contents for page
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_contents
      def page_contents(id, params = {})
        contents(Voog::API::Contents::ParentKind::Page, id, params)
      end

      # Get a single content for page
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_content
      def page_content(page_id, id, params = {})
        content(Voog::API::Contents::ParentKind::Page, page_id, id, params)
      end

      # Create a page content for page
      #
      # @see http://www.voog.com/developers/api/resources/contents#create_content
      def create_page_content(page_id, data)
        create_content(Voog::API::Contents::ParentKind::Page, page_id, data)
      end

      # Delete a content from page
      #
      # @see http://www.voog.com/developers/api/resources/contents#delete_content
      def delete_page_content(page_id, id)
        delete_content(Voog::API::Contents::ParentKind::Page, page_id, id)
      end

      # Reorder/move page content inside/between content areas and parent objects
      #
      # @see http://www.voog.com/developers/api/resources/contents#relocate_content
      def move_page_content(page_id, id, params = {})
        move_content(Voog::API::Contents::ParentKind::Page, page_id, id, params)
      end
    end
  end
end
