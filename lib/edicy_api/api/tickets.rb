module Edicy
  class API
    module Tickets

      # List form tickets
      def tickets(form_id, params = {})
        get "forms/#{form_id}/tickets", {query: params}
      end

      # Get a single ticket for form
      def ticket(form_id, id, params = {})
        get "forms/#{form_id}/tickets/#{id}", {query: params}
      end

      # Delete a form ticket
      def delete_ticket(form_id, id)
        delete "forms/#{form_id}/tickets/#{id}"
      end

      # Delete all spam ticket for form
      def delete_spam_tickets(form_id)
        delete "forms/#{form_id}/tickets/delete_spam"
      end
    end
  end
end
