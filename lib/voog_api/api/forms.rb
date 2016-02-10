module Voog
  class API

    # Voog Forms API methods.
    #
    # @see http://www.voog.com/developers/api/resources/forms
    module Forms

      # List forms
      #
      # @see http://www.voog.com/developers/api/resources/forms#get_forms
      def forms(params = {})
        paginate 'forms', {query: params}
      end

      # Get a single form
      #
      # @see http://www.voog.com/developers/api/resources/forms#get_form
      def form(id, params = {})
        get "forms/#{id}", {query: params}
      end

      # Update a form
      #
      # @see http://www.voog.com/developers/api/resources/forms#update_form
      def update_form(id, data)
        put "forms/#{id}", data
      end
    end
  end
end
