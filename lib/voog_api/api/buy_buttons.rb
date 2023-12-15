module Voog
  class API
    # Voog Buy Buttons API methods.
    #
    # @see https://www.voog.com/developers/api/resources/buy_buttons
    module BuyButtons

      # List buy_buttons
      #
      # @see https://www.voog.com/developers/api/resources/buy_buttons#get_buy_buttons
      def buy_buttons(params = {})
        paginate 'buy_buttons', {query: params}
      end

      # Get a single buy_button
      #
      # @see https://www.voog.com/developers/api/resources/buy_buttons#get_buy_button
      def buy_button(id, params = {})
        get "buy_buttons/#{id}", {query: params}
      end

      # Update a buy_button
      #
      # @see https://www.voog.com/developers/api/resources/buy_buttons#update_buy_button
      def update_buy_button(id, data)
        put "buy_buttons/#{id}", data
      end
    end
  end
end
