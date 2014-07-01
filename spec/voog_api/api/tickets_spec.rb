require 'spec_helper'

describe Voog::API::Tickets do

  let(:client) { voog_client }

  describe '#tickets' do
    before do
      request_fixture(:get, 'forms/1/tickets', fixture: 'tickets/tickets')
    end

    it 'returns a list of tickets' do
      expect(client.tickets(1).length).to eql(2)
    end
  end

  describe '#ticket' do
    before do
      request_fixture(:get, 'forms/1/tickets/1', fixture: 'tickets/ticket')
    end

    it 'returns a single ticket' do
      expect(client.ticket(1, 1).user_country).to eq('us')
    end

    it 'returns a ticket with the same id as in the request' do
      expect(client.ticket(1, 1).id).to eq(1)
    end
  end

  describe '#delete_ticket' do

    before do
      request_fixture(:delete, 'forms/1/tickets/2')
    end

    it 'calls delete method on ticket' do
      client.delete_ticket(1, 2)
      assert_requested :delete, 'http://voog.test/admin/api/forms/1/tickets/2'
    end
  end

  describe '#delete_spam_tickets' do

    before do
      request_fixture(:delete, 'forms/1/tickets/delete_spam')
    end

    it 'calls delete_spam method on ticket' do
      client.delete_spam_tickets(1)
      assert_requested :delete, 'http://voog.test/admin/api/forms/1/tickets/delete_spam'
    end
  end
end
