require 'spec_helper'

describe Edicy::API::Articles do

  let(:client) { edicy_client }

  describe '#articles' do
    before do
      request_fixture(:get, 'articles', fixture: 'articles/articles')
    end

    it 'returns a list of articles' do
      expect(client.articles.length).to eql(2)
    end
  end

  describe '#article' do
    before do
      request_fixture(:get, 'articles/2', fixture: 'articles/article')
    end

    it 'returns a single article' do
      expect(client.article(2).title).to eq('How I wrote my first article')
    end

    it 'returns a article with the same id as in the request' do
      expect(client.article(2).id).to eq(2)
    end
  end

  describe '#delete_article' do

    before do
      request_fixture(:delete, 'articles/2')
    end

    it 'calls delete method on article' do
      client.delete_article(2)
      assert_requested :delete, 'http://edicy.test/admin/api/articles/2'
    end
  end

  describe '#update_article' do

    before do
      request_fixture(:put, 'articles/2', request: {body: {title: 'New release!'}}, response: {body: '{"id": 2, "title": "New release!"}'})
    end

    it 'responds with new title' do
      expect(client.update_article(2, title: 'New release!').title).to eq('New release!')
    end
  end

  describe '#update_article_data' do

    before do
      request_fixture(:put, 'articles/2/data/my_key', request: {body: {value: 'New key'}}, response: {body: '{"id": 2, "data": {"my_key": "New key"}}'})
    end

    it 'responds with new title' do
      expect(client.update_article_data(2, 'my_key', 'New key').data.my_key).to eq('New key')
    end
  end
end
