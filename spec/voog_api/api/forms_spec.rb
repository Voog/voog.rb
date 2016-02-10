require 'spec_helper'

describe Voog::API::Forms do

  let(:client) { voog_client }

  describe '#forms' do
    before do
      request_fixture(:get, 'forms', fixture: 'forms/forms')
    end

    it 'returns a list of forms' do
      expect(client.forms.length).to eql(2)
    end
  end

  describe '#form' do
    before do
      request_fixture(:get, 'forms/2', fixture: 'forms/form')
    end

    it 'returns a single form' do
      expect(client.form(2).title).to eq('Contact')
    end

    it 'returns a form with the same id as in the request' do
      expect(client.form(2).id).to eq(2)
    end
  end

  describe '#update_form' do

    before do
      request_fixture(:put, 'forms/2', request: {body: {title: 'Updated title', submit_label: 'Send!'}}, response: {body: '{"id": 2, "title": "Updated title", "submit_label": "Send!"}'})
    end

    it 'responds with new title' do
      expect(client.update_form(2, title: 'Updated title', submit_label: 'Send!').title).to eq('Updated title')
    end
  end

  describe '#delete_form' do

    before do
      request_fixture(:delete, 'forms/2')
    end

    it 'calls delete method on form' do
      client.delete_form(2)
      assert_requested :delete, 'http://voog.test/admin/api/forms/2'
    end
  end
end
