module Edicy
  class API
    module Elements

      # List elements
      def elements(params = {})
        get 'elements', {query: params}
      end

      # Get a single element
      def element(id, params = {})
        get "elements/#{id}", {query: params}
      end

      # Create a element
      def create_element(data)
        post 'elements', data
      end

      # Update a element
      def update_element(id, data)
        put "elements/#{id}", data
      end

      # Delete a element
      def delete_element(id)
        delete "elements/#{id}"
      end

      # Reorder a elements
      def move_element(element_id, params)
        put "elements/#{element_id}/move", nil, {query: params}
      end

      # Element contents

      # List contents for element
      def element_contents(id, params = {})
        contents(Edicy::API::Contents::ParentKind::Element, id, params)
      end

      # Get a single content for element
      def element_content(element_id, id, params = {})
        content(Edicy::API::Contents::ParentKind::Element, element_id, id, params)
      end

      # Create a element content for element
      def create_element_content(element_id, data)
        create_content(Edicy::API::Contents::ParentKind::Element, element_id, data)
      end

      # Delete a content from element
      def delete_element_content(element_id, id)
        delete_content(Edicy::API::Contents::ParentKind::Element, element_id, id)
      end

      # Reorder/move element content inside/between content areas and parent objects
      def move_element_content(element_id, id, params = {})
        move_content(Edicy::API::Contents::ParentKind::Element, element_id, id, params)
      end
    end
  end
end
