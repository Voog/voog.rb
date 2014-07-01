require 'spec_helper'

describe Voog::API::Layouts do
  
  let(:client) { voog_client }
  
  describe '#layouts' do
    before do
      request_fixture(:get, 'layouts', fixture: 'layouts/layouts')
    end

    it 'returns a list of layouts' do
      expect(client.layouts.length).to eql(2)
    end
  end

  describe '#layout' do
    before do
      request_fixture(:get, 'layouts/2', fixture: 'layouts/layout')
    end
  
    it 'returns a single layout' do
      expect(client.layout(2).title).to eq('Blog & News')
    end
  
    it 'returns a layout with the same id as in the request' do
      expect(client.layout(2).id).to eq(2)
    end
  end
  
  describe '#delete_layout' do
    
    before do
      request_fixture(:delete, 'layouts/2')
    end
    
    it 'calls delete method on layout' do
      client.delete_layout(2)
      assert_requested :delete, 'http://voog.test/admin/api/layouts/2'
    end
  end
  
  describe '#update_layout' do
    
    before do
      request_fixture(:put, 'layouts/2', request: {body: {title: 'Updated title'}}, response: {body: '{"id": 2, "title": "Updated title"}'})
    end
    
    it 'responds with new title' do
      expect(client.update_layout(2, title: 'Updated title').title).to eq('Updated title')
    end
  end
end
