require 'spec_helper'

describe Voog::API::LayoutAssets do
  
  let(:client) { voog_client }
  
  describe '#layout_assets' do
    before do
      request_fixture(:get, 'layout_assets', fixture: 'layout_assets/layout_assets')
    end
  
    it 'returns a list of layout_assets' do
      expect(client.layout_assets.length).to eq(2)
    end
  end
  
  describe '#layout_asset' do
    before do
      request_fixture(:get, 'layout_assets/2', fixture: 'layout_assets/layout_asset')
    end
  
    it 'returns a single layout_asset' do
      expect(client.layout_asset(2).filename).to eq('style.css')
    end
  
    it 'returns a layout_asset with the same id as in the request' do
      expect(client.layout_asset(2).id).to eql(2)
    end
  
  end
  
  describe '#delete_layout_asset' do
    
    before do
      request_fixture(:delete, 'layout_assets/2')
    end
    
    it 'calls delete method on layout asset' do
      client.delete_layout_asset(2)
      assert_requested :delete, voog_url('layout_assets/2')
    end
  end
  
  describe '#update_layout_asset' do
    
    before do
      request_fixture(:put, 'layout_assets/2', request: {body: {filename: 'new_asset.css'}}, response: {body: '{"id": 2, "filename": "new_asset.css"}'})
    end
    
    it 'changes filename' do
      expect(client.update_layout_asset(2, filename: 'new_asset.css').filename).to eq('new_asset.css')
    end
  end
end
