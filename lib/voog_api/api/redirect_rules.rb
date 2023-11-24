module Voog
  class API
    # Voog Redirect Rules API methods.
    #
    # @see https://www.voog.com/developers/api/resources/redirect_rules
    module RedirectRules

      # List redirect_rules
      #
      # @see https://www.voog.com/developers/api/resources/redirect_rules#get_redirect_rules
      def redirect_rules(params = {})
        paginate 'redirect_rules', {query: params}
      end

      # Get a single redirect_rule
      #
      # @see https://www.voog.com/developers/api/resources/redirect_rules#get_redirect_rule
      def redirect_rule(id, params = {})
        get "redirect_rules/#{id}", {query: params}
      end

      # Create a new redirect_rule
      #
      # @see https://www.voog.com/developers/api/resources/redirect_rules#create_redirect_rules
      def create_redirect_rule(data)
        post 'redirect_rules', data
      end

      # Update a redirect_rule
      #
      # @see https://www.voog.com/developers/api/resources/redirect_rules#update_redirect_rule
      def update_redirect_rule(id, data)
        put "redirect_rules/#{id}", data
      end

      # Delete a redirect_rule
      #
      # @see https://www.voog.com/developers/api/resources/redirect_rules#delete_redirect_rule
      def delete_redirect_rule(id)
        delete "redirect_rules/#{id}"
      end
    end
  end
end
