module Edicy
  class API
    module Layouts
      
      def layouts
        get 'layouts'
      end

      def layout(id)
        get "layouts/#{id}"
      end

      def create_layout(data)
        post 'layouts', data
      end

      def update_layout(id, data)
        put "layouts/#{id}", data
      end

      def delete_layout(id)
        delete "layouts/#{id}"
      end
    end
  end
end
