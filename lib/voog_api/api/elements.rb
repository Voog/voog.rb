module Voog
  class API

    # Voog Element Definitions API methods.
    #
    # @see http://www.voog.com/developers/api/resources/elements
    module Elements

      # List elements
      #
      # @see http://www.voog.com/developers/api/resources/elements#get_elements
      def elements(params = {})
        paginate 'elements', {query: params}
      end

      # Get a single element
      #
      # @see http://www.voog.com/developers/api/resources/elements#get_element
      def element(id, params = {})
        get "elements/#{id}", {query: params}
      end

      # Create a element
      #
      # @see http://www.voog.com/developers/api/resources/elements#create_element
      def create_element(data)
        post 'elements', data
      end

      # Update a element
      #
      # @see http://www.voog.com/developers/api/resources/elements#update_element
      def update_element(id, data)
        put "elements/#{id}", data
      end

      # Delete a element
      #
      # @see http://www.voog.com/developers/api/resources/elements#remove_element
      def delete_element(id)
        delete "elements/#{id}"
      end

      # Reorder a elements
      #
      # @see http://www.voog.com/developers/api/resources/elements#move_element
      def move_element(element_id, params)
        put "elements/#{element_id}/move", nil, {query: params}
      end

      # Element contents

      # List contents for element
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_contents
      def element_contents(id, params = {})
        contents(Voog::API::Contents::ParentKind::Element, id, params)
      end

      # Get a single content for element
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_content
      def element_content(element_id, id, params = {})
        content(Voog::API::Contents::ParentKind::Element, element_id, id, params)
      end

      # Create a element content for element
      #
      # @see http://www.voog.com/developers/api/resources/contents#create_content
      def create_element_content(element_id, data)
        create_content(Voog::API::Contents::ParentKind::Element, element_id, data)
      end

      # Delete a content from element
      #
      # @see http://www.voog.com/developers/api/resources/contents#delete_content
      def delete_element_content(element_id, id)
        delete_content(Voog::API::Contents::ParentKind::Element, element_id, id)
      end

      # Reorder/move element content inside/between content areas and parent objects
      #
      # @see http://www.voog.com/developers/api/resources/contents#relocate_content
      def move_element_content(element_id, id, params = {})
        move_content(Voog::API::Contents::ParentKind::Element, element_id, id, params)
      end
    end
  end
end
