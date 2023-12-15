require 'spec_helper'

describe Voog::API::RedirectRules do

  let(:client) { voog_client }

  describe '#redirect_rules' do
    before do
      request_fixture(:get, 'redirect_rules', fixture: 'redirect_rules/redirect_rules')
    end

    it 'returns a list of redirect_rules' do
      expect(client.redirect_rules.length).to eql(2)
    end
  end

  describe '#redirect_rule' do
    before do
      request_fixture(:get, 'redirect_rules/2', fixture: 'redirect_rules/redirect_rule')
    end

    it 'returns a single redirect_rule' do
      expect(client.redirect_rule(2).source).to eq('/other-page')
    end

    it 'returns a redirect_rule with the same id as in the request' do
      expect(client.redirect_rule(2).id).to eq(2)
    end
  end

  describe '#delete_redirect_rule' do
    before do
      request_fixture(:delete, 'redirect_rules/2')
    end

    it 'calls delete method on redirect_rule' do
      client.delete_redirect_rule(2)

      assert_requested :delete, 'http://voog.test/admin/api/redirect_rules/2'
    end
  end

  describe '#update_redirect_rule' do
    let(:new_source) { '/new-source' }
    before do
      request_fixture(
        :put,
        'redirect_rules/2',
        request: {
          body: {source: new_source}
        },
        response: {
          body: "{\"id\": 2, \"source\": \"#{new_source}\"}"
        }
      )
    end

    it 'responds with new source' do
      expect(client.update_redirect_rule(2, source: new_source).source).to eq(new_source)
    end
  end
end
