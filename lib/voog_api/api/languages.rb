module Voog
  class API

    # Voog Languages API methods.
    #
    # @see http://www.voog.com/developers/api/resources/languages
    module Languages

      # List languages
      #
      # @see http://www.voog.com/developers/api/resources/languages#get_languages
      def languages(params = {})
        paginate 'languages', {query: params}
      end

      # Get a single language
      #
      # @see http://www.voog.com/developers/api/resources/languages#get_language
      def language(id, params = {})
        get "languages/#{id}", {query: params}
      end

      # Create a language
      #
      # @see http://www.voog.com/developers/api/resources/languages#create_language
      def create_language(data)
        post 'languages', data
      end

      # Update a language
      #
      # @see http://www.voog.com/developers/api/resources/languages#update_language
      def update_language(id, data)
        put "languages/#{id}", data
      end

      # Delete a language
      #
      # @see http://www.voog.com/developers/api/resources/languages#remove_language
      def delete_language(id)
        delete "languages/#{id}"
      end

      # Reorder a language
      #
      # @see http://www.voog.com/developers/api/resources/languages#move_language
      def move_language(language_id, params)
        put "languages/#{language_id}/move", nil, {query: params}
      end

      # Enable language automatic detection for site visitors
      #
      # @see http://www.voog.com/developers/api/resources/languages#enable_autodetect
      def enable_language_autodetect
        put "languages/enable_autodetect", nil
      end

      # Language contents

      # List contents for language
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_contents
      def language_contents(id, params = {})
        contents(Voog::API::Contents::ParentKind::Language, id, params)
      end

      # Get a single content for language
      #
      # @see http://www.voog.com/developers/api/resources/contents#get_content
      def language_content(language_id, id, params = {})
        content(Voog::API::Contents::ParentKind::Language, language_id, id, params)
      end

      # Create a language content for language
      #
      # @see http://www.voog.com/developers/api/resources/contents#create_content
      def create_language_content(language_id, data)
        create_content(Voog::API::Contents::ParentKind::Language, language_id, data)
      end

      # Delete a content from language
      #
      # @see http://www.voog.com/developers/api/resources/contents#delete_content
      def delete_language_content(language_id, id)
        delete_content(Voog::API::Contents::ParentKind::Language, language_id, id)
      end

      # Reorder/move language content inside/between content areas and parent objects
      #
      # @see http://www.voog.com/developers/api/resources/contents#relocate_content
      def move_language_content(language_id, id, params = {})
        move_content(Voog::API::Contents::ParentKind::Language, language_id, id, params)
      end
    end
  end
end
