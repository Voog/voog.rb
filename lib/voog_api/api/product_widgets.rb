module Voog

  class API
    # Voog Product Widgets API methods.
    #
    # @see https://www.voog.com/developers/api/resources/product_widgets
    module ProductWidgets

      # List product_widgets
      #
      # @see https://www.voog.com/developers/api/resources/product_widgets#get_product_widgets
      def product_widgets(params = {})
        paginate 'product_widgets', {query: params}
      end

      # Get a single product_widget
      #
      # @see https://www.voog.com/developers/api/resources/product_widgets#get_product_widget
      def product_widget(id, params = {})
        get "product_widgets/#{id}", {query: params}
      end

      # Update a product_widget
      #
      # @see https://www.voog.com/developers/api/resources/product_widgets#update_product_widget
      def update_product_widget(id, data)
        put "product_widgets/#{id}", data
      end
    end
  end
end
