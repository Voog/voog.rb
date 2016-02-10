require 'spec_helper'

describe Voog::API::SiteUsers do

  let(:client) { voog_client }

  describe '#site_users' do
    before do
      request_fixture(:get, 'site_users', fixture: 'site_users/site_users')
    end

    it 'returns a list of site users' do
      expect(client.site_users.length).to eql(2)
    end
  end

  describe '#site_user' do
    before do
      request_fixture(:get, 'site_users/2', fixture: 'site_users/site_user')
    end

    it 'returns a single site user' do
      expect(client.site_user(2).email).to eq('test2@test.ee')
    end

    it 'returns a site user with the same id as in the request' do
      expect(client.site_user(2).id).to eq(2)
    end
  end

  describe '#delete_site_user' do

    before do
      request_fixture(:delete, 'site_users/2')
    end

    it 'calls delete method on site user' do
      client.delete_site_user(2)
      assert_requested :delete, 'http://voog.test/admin/api/site_users/2'
    end
  end
end
