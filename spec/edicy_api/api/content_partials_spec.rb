require 'spec_helper'

describe Edicy::API::ContentPartials do

  let(:client) { edicy_client }

  describe '#content_partials' do
    before do
      request_fixture(:get, 'content_partials', fixture: 'content_partials/content_partials')
    end

    it 'returns a list of content partials' do
      expect(client.content_partials.length).to eql(2)
    end
  end

  describe '#content_partial' do
    before do
      request_fixture(:get, 'content_partials/2', fixture: 'content_partials/content_partial')
    end

    it 'returns a single content partial' do
      expect(client.content_partial(2).body).to eq('<iframe></iframe>')
    end

    it 'returns a content_partial with the same id as in the request' do
      expect(client.content_partial(2).id).to eq(2)
    end
  end

  describe '#update_content_partial' do

    before do
      request_fixture(:put, 'content_partials/2', request: {body: {body: '<object></object>', metainfo: {type: 'custom'}}}, response: {body: '{"id": 2, "content_type": "custom"}'})
    end

    it 'responds with new autosaved_body' do
      expect(client.update_content_partial(2, body: '<object></object>', metainfo: {type: 'custom'}).content_type).to eq('custom')
    end
  end
end
