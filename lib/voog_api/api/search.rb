module Voog
  class API

    # Voog site Search API methods.
    #
    # @see http://www.voog.com/developers/api/resources/search
    module Search

      # Perform full text search over current public (and indexed) content.
      #
      # @see http://www.voog.com/developers/api/resources/search#get_search
      def search(params = {})
        paginate 'search', {query: params}
      end
    end
  end
end
