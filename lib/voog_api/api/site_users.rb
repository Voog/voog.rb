module Voog
  class API

    # Voog Site Users API methods. Manage users who have access to password protected pages.
    #
    # @see http://www.voog.com/support/guides/managing-your-website-pages/password-protected-pages
    # @see http://www.voog.com/developers/api/resources/site_users
    module SiteUsers

      # List site users with access to password protected pages
      #
      # @see http://www.voog.com/developers/api/resources/site_users#get_site_users
      def site_users(params = {})
        paginate 'site_users', {query: params}
      end

      # Invite a new user to see password protected pages
      #
      # @see http://www.voog.com/developers/api/resources/site_users#create_site_user
      def create_site_user(data)
        post 'site_users', data
      end
      
      # Get a single site user
      #
      # @see http://www.voog.com/developers/api/resources/site_users#get_site_user
      def site_user(id, params = {})
        get "site_users/#{id}", {query: params}
      end

      # Delete a site user
      #
      # @see http://www.voog.com/developers/api/resources/site_users#remove_site_user
      def delete_site_user(id)
        delete "site_users/#{id}"
      end
    end
  end
end
