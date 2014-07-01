require 'spec_helper'

describe Voog::API::ElementDefinitions do

  let(:client) { voog_client }

  describe '#element_definitions' do
    before do
      request_fixture(:get, 'element_definitions', fixture: 'element_definitions/element_definitions')
    end

    it 'returns a list of element_definitions' do
      expect(client.element_definitions.length).to eql(2)
    end
  end

  describe '#element_definition' do
    before do
      request_fixture(:get, 'element_definitions/2', fixture: 'element_definitions/element_definition')
    end

    it 'returns a single element_definition' do
      expect(client.element_definition(2).title).to eq('Book')
    end

    it 'returns a element_definition with the same id as in the request' do
      expect(client.element_definition(2).id).to eq(2)
    end
  end

  describe '#delete_element_definition' do

    before do
      request_fixture(:delete, 'element_definitions/2')
    end

    it 'calls delete method on element_definition' do
      client.delete_element_definition(2)
      assert_requested :delete, 'http://voog.test/admin/api/element_definitions/2'
    end
  end

  describe '#update_element_definition' do

    before do
      request_fixture(:put, 'element_definitions/2', request: {body: {title: 'Fiction book'}}, response: {body: '{"id": 2, "title": "Fiction book"}'})
    end

    it 'responds with new title' do
      expect(client.update_element_definition(2, title: 'Fiction book').title).to eq('Fiction book')
    end
  end
end
