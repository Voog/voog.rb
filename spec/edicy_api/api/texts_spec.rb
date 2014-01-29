require 'spec_helper'

describe Edicy::API::Texts do

  let(:client) { edicy_client }

  describe '#texts' do
    before do
      request_fixture(:get, 'texts', fixture: 'texts/texts')
    end

    it 'returns a list of texts' do
      expect(client.texts.length).to eql(2)
    end
  end

  describe '#text' do
    before do
      request_fixture(:get, 'texts/2', fixture: 'texts/text')
    end

    it 'returns a single text' do
      expect(client.text(2).body).to eq('<h3>A better way to create a website</h3>')
    end

    it 'returns a text with the same id as in the request' do
      expect(client.text(2).id).to eq(2)
    end
  end

  describe '#update_text' do

    before do
      request_fixture(:put, 'texts/2', request: {body: {autosaved_body: 'Updated body'}}, response: {body: '{"id": 2, "autosaved_body": "Updated body"}'})
    end

    it 'responds with new autosaved_body' do
      expect(client.update_text(2, autosaved_body: 'Updated body').autosaved_body).to eq('Updated body')
    end
  end
end
