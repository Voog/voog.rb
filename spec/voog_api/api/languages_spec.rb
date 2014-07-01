require 'spec_helper'

describe Voog::API::Languages do

  let(:client) { voog_client }

  describe '#languages' do
    before do
      request_fixture(:get, 'languages', fixture: 'languages/languages')
    end

    it 'returns a list of languages' do
      expect(client.languages.length).to eql(2)
    end
  end

  describe '#language' do
    before do
      request_fixture(:get, 'languages/2', fixture: 'languages/language')
    end

    it 'returns a single language' do
      expect(client.language(2).title).to eq('FRA')
    end

    it 'returns a language with the same id as in the request' do
      expect(client.language(2).id).to eq(2)
    end
  end

  describe '#delete_language' do

    before do
      request_fixture(:delete, 'languages/2')
    end

    it 'calls delete method on language' do
      client.delete_language(2)
      assert_requested :delete, 'http://voog.test/admin/api/languages/2'
    end
  end

  describe '#update_language' do

    before do
      request_fixture(:put, 'languages/2', request: {body: {title: 'FR'}}, response: {body: '{"id": 2, "title": "FR"}'})
    end

    it 'responds with new title' do
      expect(client.update_language(2, title: 'FR').title).to eq('FR')
    end
  end

  describe '#move_language' do

    before do
      request_fixture(:put, 'languages/2/move?before=1', response: {body: '{"id": 2, "position": 1}'})
    end

    it 'responds with new position' do
      expect(client.move_language(2, before: 1).position).to eq(1)
    end
  end

  describe '#enable_language_autodetect' do

    before do
      request_fixture(:put, 'languages/enable_autodetect')
    end

    it 'responds body should be empty' do
      expect(client.enable_language_autodetect).to be_nil
    end
  end

  describe '#language_content' do
    before do
      request_fixture(:get, 'languages/1/contents/2', fixture: 'contents/content')
    end

    it 'returns a single content' do
      expect(client.content(Voog::API::Contents::ParentKind::Language, 1, 2).name).to eq('slogan')
    end

    it 'returns a content with the same id as in the request' do
      expect(client.content(Voog::API::Contents::ParentKind::Language, 1, 2).id).to eq(2)
    end
  end
end
