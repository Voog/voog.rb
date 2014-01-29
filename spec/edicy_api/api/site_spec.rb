require 'spec_helper'

describe Edicy::API::Site do

  let(:client) { edicy_client }

  describe '#site' do
    before do
      request_fixture(:get, 'site', fixture: 'site/site')
    end

    it 'returns a single site' do
      expect(client.site.search_enabled).to eq(false)
    end

    it 'returns a site with the same meta_keywords as in the request' do
      expect(client.site.meta_keywords).to eq('my key words')
    end
  end

  describe '#update_site' do

    before do
      request_fixture(:put, 'site', request: {body: {meta_keywords: 'new keys'}}, response: {body: '{"meta_keywords": "new keys"}'})
    end

    it 'responds with updated meta_keywords' do
      expect(client.update_site(meta_keywords: 'new keys').meta_keywords).to eq('new keys')
    end
  end

  describe '#update_site_data' do

    before do
      request_fixture(:put, 'site/data/my_key', request: {body: {value: 'New key'}}, response: {body: '{"data": {"my_key": "New key"}}'})
    end

    it 'responds updated data' do
      expect(client.update_site_data('my_key', 'New key').data.my_key).to eq('New key')
    end
  end
end
