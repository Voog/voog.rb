require 'spec_helper'

describe Edicy::API::Pages do

  let(:client) { edicy_client }

  describe '#pages' do
    before do
      request_fixture(:get, 'pages', fixture: 'pages/pages')
    end

    it 'returns a list of pages' do
      expect(client.pages.length).to eql(2)
    end
  end

  describe '#page' do
    before do
      request_fixture(:get, 'pages/2', fixture: 'pages/page')
    end

    it 'returns a single page' do
      expect(client.page(2).title).to eq('Products')
    end

    it 'returns a page with the same id as in the request' do
      expect(client.page(2).id).to eq(2)
    end
  end

  describe '#delete_page' do

    before do
      request_fixture(:delete, 'pages/2')
    end

    it 'calls delete method on page' do
      client.delete_page(2)
      assert_requested :delete, 'http://edicy.test/admin/api/pages/2'
    end
  end

  describe '#update_page' do

    before do
      request_fixture(:put, 'pages/2', request: {body: {title: 'Updated title'}}, response: {body: '{"id": 2, "title": "Updated title"}'})
    end

    it 'responds with new title' do
      expect(client.update_page(2, title: 'Updated title').title).to eq('Updated title')
    end
  end

  describe '#update_page_data' do

    before do
      request_fixture(:put, 'pages/2/data/my_key', request: {body: {value: 'New key'}}, response: {body: '{"id": 2, "data": {"my_key": "New key"}}'})
    end

    it 'responds with new title' do
      expect(client.update_page_data(2, 'my_key', 'New key').data.my_key).to eq('New key')
    end
  end
end
