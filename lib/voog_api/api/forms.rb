module Voog
  class API
    module Forms

      # List forms
      def forms(params = {})
        paginate 'forms', {query: params}
      end

      # Get a single form
      def form(id, params = {})
        get "forms/#{id}", {query: params}
      end

      # Update a form
      def update_form(id, data)
        put "forms/#{id}", data
      end
    end
  end
end
