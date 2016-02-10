module Voog
  class API

    # Voog article Comments API methods.
    #
    # @see http://www.voog.com/developers/api/resources/comments
    module Comments

      # List article comments
      #
      # @see http://www.voog.com/developers/api/resources/comments#get_comments
      def comments(article_id, params = {})
        paginate "articles/#{article_id}/comments", {query: params}
      end

      # Get a single comment for article
      #
      # @see http://www.voog.com/developers/api/resources/comments#get_comment
      def comment(article_id, id, params = {})
        get "articles/#{article_id}/comments/#{id}", {query: params}
      end

      # Create a comment
      #
      # @see http://www.voog.com/developers/api/resources/comments#create_comment
      def create_comment(article_id, data)
        post "articles/#{article_id}/comments", data
      end

      # Toggle comment spam flag
      #
      # @see http://www.voog.com/developers/api/resources/comments#toggle_spam_comment
      def toggle_spam_comment(article_id, id)
        put "articles/#{article_id}/comments/#{id}/toggle_spam", nil
      end

      # Delete a article comment
      #
      # @see http://www.voog.com/developers/api/resources/comments#remove_comment
      def delete_comment(article_id, id)
        delete "articles/#{article_id}/comments/#{id}"
      end

      # Delete all spam comment for article
      #
      # @see http://www.voog.com/developers/api/resources/comments#delete_spam_comments
      def delete_spam_comments(article_id)
        delete "articles/#{article_id}/comments/delete_spam"
      end
    end
  end
end
