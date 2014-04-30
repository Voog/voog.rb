module Edicy
  class API
    module Comments

      # List article comments
      def comments(article_id, params = {})
        get "articles/#{article_id}/comments", {query: params}
      end

      # Get a single comment for article
      def comment(article_id, id, params = {})
        get "articles/#{article_id}/comments/#{id}", {query: params}
      end

      # Create a comment
      def create_comment(article_id, data)
        post "articles/#{article_id}/comments", data
      end

      # Toggle comment spam flag
      def toggle_spam_comment(article_id, id)
        put "articles/#{article_id}/comments/#{id}/toggle_spam", nil
      end

      # Delete a article comment
      def delete_comment(article_id, id)
        delete "articles/#{article_id}/comments/#{id}"
      end

      # Delete all spam comment for article
      def delete_spam_comments(article_id)
        delete "articles/#{article_id}/comments/delete_spam"
      end
    end
  end
end
