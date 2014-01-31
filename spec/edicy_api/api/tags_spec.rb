require 'spec_helper'

describe Edicy::API::Tags do

  let(:client) { edicy_client }

  describe '#tags' do
    before do
      request_fixture(:get, 'tags', fixture: 'tags/tags')
    end

    it 'returns a list of tags' do
      expect(client.tags.length).to eql(2)
    end
  end

  describe '#tag' do
    before do
      request_fixture(:get, 'tags/2', fixture: 'tags/tag')
    end

    it 'returns a single tag' do
      expect(client.tag(2).name).to eq('art')
    end

    it 'returns a tag with the same id as in the request' do
      expect(client.tag(2).id).to eq(2)
    end
  end

  describe '#update_tag' do

    before do
      request_fixture(:put, 'tags/2', request: {body: {name: 'New Label'}}, response: {body: '{"id": 2, "name": "New Label"}'})
    end

    it 'responds with new name' do
      expect(client.update_tag(2, name: 'New Label').name).to eq('New Label')
    end
  end

  describe '#delete_tag' do

    before do
      request_fixture(:delete, 'tags/2')
    end

    it 'calls delete method on tag' do
      client.delete_tag(2)
      assert_requested :delete, 'http://edicy.test/admin/api/tags/2'
    end
  end
end
