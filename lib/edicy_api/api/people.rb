module Edicy
  class API
    module People

      # List people
      def people(params = {})
        get 'people', {query: params}
      end

      # Get a single person
      def person(id, params = {})
        get "people/#{id}", {query: params}
      end
    end
  end
end
