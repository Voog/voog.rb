module Edicy
  class API
    module Languages

      # List languages
      def languages(params = {})
        get 'languages', {query: params}
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
        put "languages/enable_autodetect", nil, nil
      end
    end
  end
end
