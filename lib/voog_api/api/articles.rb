module Voog
  class API
    module Articles

      # List articles
      def articles(params = {})
        paginate 'articles', {query: params}
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

      # Patch a article
      def patch_article(id, data)
        patch "articles/#{id}", data
      end

      # Delete a article
      def delete_article(id)
        delete "articles/#{id}"
      end

      # Update/create a key in article data field
      #
      # @param id [String] key in data field
      def update_article_data(article_id, id, data)
        put "articles/#{article_id}/data/#{id}", {value: data}
      end

      # Delete a key from article data field
      #
      # @param id [String] key in data field
      def delete_article_data(article_id, id)
        delete "articles/#{article_id}/data/#{id}"
      end

      # Article contents

      # List contents for article
      def article_contents(id, params = {})
        contents(Voog::API::Contents::ParentKind::Article, id, params)
      end

      # Get a single content for article
      def article_content(article_id, id, params = {})
        content(Voog::API::Contents::ParentKind::Article, article_id, id, params)
      end

      # Create a article content for article
      def create_article_content(article_id, data)
        create_content(Voog::API::Contents::ParentKind::Article, article_id, data)
      end

      # Delete a content from article
      def delete_article_content(article_id, id)
        delete_content(Voog::API::Contents::ParentKind::Article, article_id, id)
      end

      # Reorder/move article content inside/between content areas and parent objects
      def move_article_content(article_id, id, params = {})
        move_content(Voog::API::Contents::ParentKind::Article, article_id, id, params)
      end
    end
  end
end
