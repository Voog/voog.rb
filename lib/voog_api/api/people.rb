module Voog
  class API

    # Voog People API methods.
    #
    # @see http://www.voog.com/developers/api/resources/people
    module People

      # List people
      #
      # @see http://www.voog.com/developers/api/resources/people#get_people
      def people(params = {})
        paginate 'people', {query: params}
      end

      # Get a single person
      #
      # @see http://www.voog.com/developers/api/resources/people#get_person
      def person(id, params = {})
        get "people/#{id}", {query: params}
      end
    end
  end
end
