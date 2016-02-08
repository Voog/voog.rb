module Voog
  class API
    module ElementDefinitions

      # List element_definitions
      def element_definitions(params = {})
        paginate 'element_definitions', {query: params}
      end

      # Get a single element_definition
      def element_definition(id, params = {})
        get "element_definitions/#{id}", {query: params}
      end

      # Create a element_definition
      def create_element_definition(data)
        post 'element_definitions', data
      end

      # Update a element_definition
      def update_element_definition(id, data)
        put "element_definitions/#{id}", data
      end

      # Delete a element_definition
      def delete_element_definition(id)
        delete "element_definitions/#{id}"
      end
    end
  end
end
