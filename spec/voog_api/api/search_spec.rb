require 'spec_helper'

describe Voog::API::Search do

  let(:client) { voog_client }

  describe '#people' do
    before do
      request_fixture(:get, 'search', request: {query: {q: 'any kind of content'}}, fixture: 'search/search')
    end

    it 'returns a list of search results' do
      expect(client.search.result.length).to eql(3)
    end
  end
end
