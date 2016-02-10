module Voog
  class API
    module Search

      # Perform full text search over current public (and indexed) content.
      #
      # @see http://www.voog.com/developers/api/resources/search
      def search(params = {})
        paginate 'search', {query: params}
      end
    end
  end
end
