module Edicy
  class API
    module Tags

      def tags
        get 'tags'
      end

      def tag(id)
        get "tags/#{id}"
      end

      def create_tag(data)
        post 'tags', data
      end

      def update_tag(id, data)
        put "tags/#{id}", data
      end

      def delete_tag(id)
        delete "tags/#{id}"
      end

    end
  end
end
