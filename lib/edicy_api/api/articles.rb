module Edicy
  class API
    module Articles

      # List articles
      def articles(params = {})
        get 'articles', {query: params}
      end

      # Get a single article
      def article(id, params = {})
        get "articles/#{id}", {query: params}
      end

      # Create a article
      def create_article(data)
        post 'articles', data
      end

      # Update a article
      def update_article(id, data)
        put "articles/#{id}", data
      end

      # Delete a article
      def delete_article(id)
        delete "articles/#{id}"
      end

      # Update/create a key in article data field
      #
      # @params id [String] key in data field
      def update_article_data(article_id, id, data)
        put "articles/#{article_id}/data/#{id}", {value: data}
      end

      # Delete a key from article data field
      #
      # @params id [String] key in data field
      def delete_article_data(article_id, id)
        delete "articles/#{article_id}/data/#{id}"
      end
    end
  end
end
