require 'spec_helper'

describe Edicy::API::Comments do

  let(:client) { edicy_client }

  describe '#comments' do
    before do
      request_fixture(:get, 'articles/1/comments', fixture: 'comments/comments')
    end

    it 'returns a list of comments' do
      expect(client.comments(1).length).to eql(2)
    end
  end

  describe '#comment' do
    before do
      request_fixture(:get, 'articles/1/comments/2', fixture: 'comments/comment')
    end

    it 'returns a single comment' do
      expect(client.comment(1, 2).body).to eq('Buy something!')
    end

    it 'returns a comment with the same id as in the request' do
      expect(client.comment(1, 2).id).to eq(2)
    end
  end

  describe '#toggle_spam_comment' do

    before do
      request_fixture(:put, 'articles/1/comments/2/toggle_spam', response: {body: '{"id": 2, "spam": true}'})
    end

    it 'responds with new title' do
      expect(client.toggle_spam_comment(1, 2).spam).to eq(true)
    end
  end


  describe '#delete_comment' do

    before do
      request_fixture(:delete, 'articles/1/comments/2')
    end

    it 'calls delete method on comment' do
      client.delete_comment(1, 2)
      assert_requested :delete, 'http://edicy.test/admin/api/articles/1/comments/2'
    end
  end

  describe '#delete_spam_comments' do

    before do
      request_fixture(:delete, 'articles/1/comments/delete_spam')
    end

    it 'calls delete_spam method on comment' do
      client.delete_spam_comments(1)
      assert_requested :delete, 'http://edicy.test/admin/api/articles/1/comments/delete_spam'
    end
  end
end
