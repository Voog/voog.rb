require 'spec_helper'

describe Voog::API::Assets do

  let(:client) { voog_client }

  describe '#assets' do
    before do
      request_fixture(:get, 'assets', fixture: 'assets/assets')
    end

    it 'returns a list of assets' do
      expect(client.assets.length).to eql(2)
    end
  end

  describe '#asset' do
    before do
      request_fixture(:get, 'assets/1', fixture: 'assets/asset')
    end

    it 'returns a single asset' do
      expect(client.asset(1).filename).to eq('Screen Shot 2014-01-28 at 10.53.26.png')
    end

    it 'returns an asset with the same id as in the request' do
      expect(client.asset(1).id).to eq(1)
    end
  end

  describe '#delete_asset' do

    before do
      request_fixture(:delete, 'assets/2')
    end

    it 'calls delete method on asset' do
      client.delete_asset(2)
      assert_requested :delete, 'http://voog.test/admin/api/assets/2'
    end
  end

  describe '#confirm_asset' do

    before do
      request_fixture(:put, 'assets/1/confirm', response: {body: '{"id": 1, "filename": "Screen Shot 2014-01-28 at 10.53.26.png"}'})
    end

    it 'responds with object' do
      expect(client.confirm_asset(1).filename).to eq('Screen Shot 2014-01-28 at 10.53.26.png')
    end
  end
end
