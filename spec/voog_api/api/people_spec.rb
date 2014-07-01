require 'spec_helper'

describe Voog::API::People do

  let(:client) { voog_client }

  describe '#people' do
    before do
      request_fixture(:get, 'people', fixture: 'people/people')
    end

    it 'returns a list of people' do
      expect(client.people.length).to eql(2)
    end
  end

  describe '#person' do
    before do
      request_fixture(:get, 'people/2', fixture: 'people/person')
    end

    it 'returns a single person' do
      expect(client.person(2).name).to eq('api@example.com')
    end

    it 'returns a person with the same id as in the request' do
      expect(client.person(2).id).to eq(2)
    end
  end
end
