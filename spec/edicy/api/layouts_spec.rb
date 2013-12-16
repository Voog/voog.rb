require 'spec_helper'

describe Edicy::API::Layouts do
  
  before do
    @client = edicy_client
  end
  
  describe '#layouts' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layouts').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(body: fixture('layouts/layouts'))
    end

    it 'returns a list of layouts' do
      expect(@client.layouts.is_a? Array).to be_true
      expect(@client.layouts.length).to eql(2)
    end
    
  end

  describe '#layout(:id)' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layouts/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(body: fixture('layouts/layout'))
    end

    it 'returns a single layout' do
      expect(@client.layout(2).is_a? Array).to be_false
      expect(@client.layout(2).is_a? OpenStruct).to be_true
    end

    it 'returns a layout with the same id as in the request' do
      expect(@client.layout(2).id).to eql(2)
    end

  end

  describe '#delete_layout(:id)' do
    it 'returns true if request was successful' do
      stub_request(:delete, 'http://edicy.test/admin/api/layouts/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(status: 200, body: "{}")
      expect(@client.delete_layout(2)).to be_true
    end

    it 'returns false if resource was not found' do
      stub_request(:delete, 'http://edicy.test/admin/api/layouts/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(status: 404, body: "{}")
      expect(@client.delete_layout(2)).to be_false
    end
  end

  describe '#update_layout(:id)' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layouts/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(body: fixture('layouts/layout'))

      @old_layout = @client.layout(2)
      @data = { "title" => "Updated title" }
      @new_data = '{ "layout": { "id": 2, "title": "Updated title" } }'
      stub_request(:put, 'http://edicy.test/admin/api/layouts/2').
        with(headers: { 'X-API-TOKEN' => @client.api_token }).
        to_return(body: @new_data)
      @new_layout = @client.update_layout(2, @data)

    end

    it 'changes title' do
      expect(@new_layout.title).not_to eq(@old_layout.title)
    end

    it 'does not change id' do
      expect(@new_layout.id).to eq(@old_layout.id)
    end
  end
end
