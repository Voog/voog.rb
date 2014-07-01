require 'spec_helper'

describe Voog::API::Contents do

  let(:client) { voog_client }

  describe '#contents' do
    before do
      request_fixture(:get, 'pages/1/contents', fixture: 'contents/contents')
    end

    it 'returns a list of contents' do
      expect(client.contents(Voog::API::Contents::ParentKind::Page, 1).length).to eql(2)
    end
  end

  describe '#content' do
    before do
      request_fixture(:get, 'pages/1/contents/2', fixture: 'contents/content')
    end

    it 'returns a single content' do
      expect(client.content(Voog::API::Contents::ParentKind::Page, 1, 2).name).to eq('slogan')
    end

    it 'returns a content with the same id as in the request' do
      expect(client.content(Voog::API::Contents::ParentKind::Page, 1, 2).id).to eq(2)
    end
  end

  describe '#delete_content' do

    before do
      request_fixture(:delete, 'pages/1/contents/2')
    end

    it 'calls delete method on content' do
      client.delete_content(Voog::API::Contents::ParentKind::Page, 1, 2)
      assert_requested :delete, 'http://voog.test/admin/api/pages/1/contents/2'
    end
  end

  describe '#move_content' do

    before do
      request_fixture(:put, 'pages/1/contents/2/move?name=body', response: {body: '{"id": 2, "name": "body"}'})
    end

    it 'responds with new name' do
      expect(client.move_content(Voog::API::Contents::ParentKind::Page, 1, 2, name: 'body').name).to eq('body')
    end
  end
end
