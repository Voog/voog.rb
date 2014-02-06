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
    end
  end
end
