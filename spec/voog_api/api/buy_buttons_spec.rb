require 'spec_helper'

describe Voog::API::BuyButtons do
  let(:client) { voog_client }

  describe '#buy_buttons' do
    before do
      request_fixture(:get, 'buy_buttons', fixture: 'buy_buttons/buy_buttons')
    end

    it 'returns a list of buy_buttons' do
      expect(client.buy_buttons.length).to eql(2)
    end
  end

  describe '#buy_button' do
    before do
      request_fixture(:get, 'buy_buttons/2', fixture: 'buy_buttons/buy_button')
    end

    it 'returns a single buy_button' do
      expect(client.buy_button(2).settings.title).to eq('Add to cart')
    end

    it 'returns a buy_button with the same id as in the request' do
      expect(client.buy_button(2).id).to eq(2)
    end
  end

  describe '#update_buy_button' do
    let(:new_title) { 'New title' }

    before do
      request_fixture(
        :put,
        'buy_buttons/2',
        request: {
          body: {
            settings: {
              title: new_title
            }
          }
        },
        response: {
          body: "{\"id\": 2, \"settings\": {\"title\": \"#{new_title}\"}}"
        }
      )
    end

    it 'responds with new title' do
      expect(
        client.update_buy_button(2, settings: {title: new_title}).settings.title
      ).to eq(new_title)
    end
  end
end
