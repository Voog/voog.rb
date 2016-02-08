module Voog
  class API
    module Languages

      # List languages
      def languages(params = {})
        paginate 'languages', {query: params}
      end

      # Get a single language
      def language(id, params = {})
        get "languages/#{id}", {query: params}
      end

      # Create a language
      def create_language(data)
        post 'languages', data
      end

      # Update a language
      def update_language(id, data)
        put "languages/#{id}", data
      end

      # Delete a language
      def delete_language(id)
        delete "languages/#{id}"
      end

      # Reorder a language
      def move_language(language_id, params)
        put "languages/#{language_id}/move", nil, {query: params}
      end

      # Enable language automatic detection for site visitors
      def enable_language_autodetect
        put "languages/enable_autodetect", nil
      end

      # Language contents

      # List contents for language
      def language_contents(id, params = {})
        contents(Voog::API::Contents::ParentKind::Language, id, params)
      end

      # Get a single content for language
      def language_content(language_id, id, params = {})
        content(Voog::API::Contents::ParentKind::Language, language_id, id, params)
      end

      # Create a language content for language
      def create_language_content(language_id, data)
        create_content(Voog::API::Contents::ParentKind::Language, language_id, data)
      end

      # Delete a content from language
      def delete_language_content(language_id, id)
        delete_content(Voog::API::Contents::ParentKind::Language, language_id, id)
      end

      # Reorder/move language content inside/between content areas and parent objects
      def move_language_content(language_id, id, params = {})
        move_content(Voog::API::Contents::ParentKind::Language, language_id, id, params)
      end
    end
  end
end
