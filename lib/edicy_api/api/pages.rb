module Edicy
  class API
    module Pages

      def pages
        get 'pages'
      end

      def page(id)
        get "pages/#{id}"
      end

    end
  end
end
