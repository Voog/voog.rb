require 'spec_helper'

describe Voog::API::MediaSets do

  let(:client) { voog_client }

  describe '#media_sets' do
    before do
      request_fixture(:get, 'media_sets', fixture: 'media_sets/media_sets')
    end

    it 'returns a list of media_sets' do
      expect(client.media_sets.length).to eql(2)
    end
  end

  describe '#media_set' do
    before do
      request_fixture(:get, 'media_sets/2', fixture: 'media_sets/media_set')
    end

    it 'returns a single media_set' do
      expect(client.media_set(2).title).to eq('Standalone media set')
    end

    it 'returns a media_set with the same id as in the request' do
      expect(client.media_set(2).id).to eq(2)
    end
  end

  describe '#delete_media_set' do

    before do
      request_fixture(:delete, 'media_sets/2')
    end

    it 'calls delete method on media_set' do
      client.delete_media_set(2)
      assert_requested :delete, 'http://voog.test/admin/api/media_sets/2'
    end
  end

  describe '#update_media_set' do

    before do
      request_fixture(:put, 'media_sets/2', request: {body: {title: 'Updated title'}}, response: {body: '{"id": 2, "title": "Updated title"}'})
    end

    it 'responds with new title' do
      expect(client.update_media_set(2, title: 'Updated title').title).to eq('Updated title')
    end
  end

  describe '#media_set_add_assets' do

    before do
      request_fixture(:post, 'media_sets/2/add_assets', request: {body: {asset_ids: [5, 8]}}, response: {body: '{"id": 2, "assets": [{"id": 1}, {"id": 5}, {"id": 8}]}'})
    end

    it 'responds with correct assets set' do
      expect(client.media_set_add_assets(2, asset_ids: [5, 8]).assets.map(&:id)).to eq([1, 5, 8])
    end
  end
end
