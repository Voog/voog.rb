require 'spec_helper'

describe Edicy::API::LayoutAssets do
  
  before do
    @client = edicy_client
  end
  
  describe '#layout_assets' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layout_assets').
        with(headers: {'X-API-TOKEN' => @client.api_token}).
        to_return(body: fixture('layout_assets/layout_assets'))
    end

    it 'returns a list of layout_assets' do
      expect(@client.layout_assets.length).to eql(2)
    end
    
  end

  describe '#layout_asset' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layout_assets/2').
        with(headers: {'X-API-TOKEN' => @client.api_token}).
        to_return(body: fixture('layout_assets/layout_asset'))
    end

    it 'returns a single layout_asset' do
      expect(@client.layout_asset(2)).to be_instance_of(OpenStruct)
    end

    it 'returns a layout_asset with the same id as in the request' do
      expect(@client.layout_asset(2).id).to eql(2)
    end

  end

  describe '#delete_layout_asset' do
    it 'returns true if request was successful' do
      stub_request(:delete, 'http://edicy.test/admin/api/layout_assets/2').
        with(headers: {'X-API-TOKEN' => @client.api_token}).
        to_return(status: 200, body: "{}")
      expect(@client.delete_layout_asset(2)).to eq(true)
    end

    it 'returns false if resource was not found' do
      stub_request(:delete, 'http://edicy.test/admin/api/layout_assets/2').
        with(headers: {'X-API-TOKEN' => @client.api_token}).
        to_return(status: 404, body: "{}")
      expect(@client.delete_layout_asset(2)).to eq(false)
    end
  end

  describe '#update_layout_asset' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layout_assets/2').
        with(headers: {'X-API-TOKEN' => @client.api_token}).
        to_return(body: fixture('layout_assets/layout_asset'))

      @old_layout_asset = @client.layout_asset(2)
      @data = { "title" => "Updated title" }
      @new_data = '{ "asset": { "id": 2, "title": "Updated title" } }'
      stub_request(:put, 'http://edicy.test/admin/api/layout_assets/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(body: @new_data)
      @new_layout_asset = @client.update_layout_asset(2, @data)
    end

    it 'changes title' do
      expect(@new_layout_asset.title).not_to eq(@old_layout_asset.title)
    end

    it 'does not change id' do
      expect(@new_layout_asset.id).to eq(@old_layout_asset.id)
    end
  end
end
