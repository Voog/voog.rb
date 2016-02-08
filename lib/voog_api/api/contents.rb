module Voog
  class API
    module Contents

      module ParentKind
        Article = 'articles'
        Element = 'elements'
        Language = 'languages'
        Page = 'pages'
      end

      # List contents
      def contents(parent_name, parent_id, params = {})
        paginate "#{parent_name}/#{parent_id}/contents", {query: params}
      end

      # Get a single content
      def content(parent_name, parent_id, id, params = {})
        get "#{parent_name}/#{parent_id}/contents/#{id}", {query: params}
      end

      # Create a content
      def create_content(parent_name, parent_id, data)
        post "#{parent_name}/#{parent_id}/contents", data
      end

      # Delete a content
      def delete_content(parent_name, parent_id, id)
        delete "#{parent_name}/#{parent_id}/contents/#{id}"
      end

      # Reorder/move content inside/between content areas and parent objects
      def move_content(parent_name, parent_id, id, params = {})
        put "#{parent_name}/#{parent_id}/contents/#{id}/move", nil, {query: params}
      end
    end
  end
end
