module Voog
  class API

    # Voog Tickets API methods.
    #
    # @see http://www.voog.com/developers/api/resources/tickets
    module Tickets

      # List form tickets
      #
      # @see http://www.voog.com/developers/api/resources/tickets#get_tickets
      def tickets(form_id, params = {})
        paginate "forms/#{form_id}/tickets", {query: params}
      end

      # Get a single ticket for form
      #
      # @see http://www.voog.com/developers/api/resources/tickets#get_ticket
      def ticket(form_id, id, params = {})
        get "forms/#{form_id}/tickets/#{id}", {query: params}
      end

      # Delete a form ticket
      #
      # @see http://www.voog.com/developers/api/resources/tickets#remove_ticket
      def delete_ticket(form_id, id)
        delete "forms/#{form_id}/tickets/#{id}"
      end

      # Delete all spam ticket for form
      #
      # @see http://www.voog.com/developers/api/resources/tickets#delete_spam_tickets
      def delete_spam_tickets(form_id)
        delete "forms/#{form_id}/tickets/delete_spam"
      end

      # Delete all or set of ticket for form
      #
      # @option params [Array] :ticket_ids array of ticket id that should be removed. All tickets are deleted when this parameter is not provided.
      # @see http://www.voog.com/developers/api/resources/tickets#delete_tickets
      def delete_tickets(form_id, params = {})
        delete "forms/#{form_id}/tickets/delete_tickets", {query: params}
      end
    end
  end
end
