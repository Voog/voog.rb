require 'spec_helper'

describe Edicy::API::Nodes do

  let(:client) { edicy_client }

  describe '#nodes' do
    before do
      request_fixture(:get, 'nodes', fixture: 'nodes/nodes')
    end

    it 'returns a list of nodes' do
      expect(client.nodes.length).to eql(2)
    end
  end

  describe '#node' do
    before do
      request_fixture(:get, 'nodes/2', fixture: 'nodes/node')
    end

    it 'returns a single node' do
      expect(client.node(2).title).to eq('Products')
    end

    it 'returns a node with the same id as in the request' do
      expect(client.node(2).id).to eq(2)
    end
  end

  describe '#update_node' do

    before do
      request_fixture(:put, 'nodes/2', request: {body: {title: 'About us'}}, response: {body: '{"id": 2, "title": "About us"}'})
    end

    it 'responds with new title' do
      expect(client.update_node(2, title: 'About us').title).to eq('About us')
    end
  end

  describe '#move_node' do

    before do
      request_fixture(:put, 'nodes/3/move?parent_id=2', response: {body: '{"id": 3, "parent_id": 2, "position": 1}'})
    end

    it 'responds with parent_id' do
      expect(client.move_node(3, parent_id: 2).parent_id).to eq(2)
    end
  end
end
