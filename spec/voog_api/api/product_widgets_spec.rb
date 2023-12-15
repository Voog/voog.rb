require 'spec_helper'

describe Voog::API::ProductWidgets do
  let(:client) { voog_client }

  describe '#product_widgets' do
    before do
      request_fixture(:get, 'product_widgets', fixture: 'product_widgets/product_widgets')
    end

    it 'returns a list of product_widgets' do
      expect(client.product_widgets.length).to eql(2)
    end
  end

  describe '#product_widget' do
    before do
      request_fixture(:get, 'product_widgets/2', fixture: 'product_widgets/product_widget')
    end

    it 'returns a single product_widget' do
      expect(client.product_widget(2).design_settings.layout).to eq('grid')
    end

    it 'returns a product_widget with the same id as in the request' do
      expect(client.product_widget(2).id).to eq(2)
    end
  end

  describe '#update_product_widget' do
    let(:new_layout) { 'list' }

    before do
      request_fixture(
        :put,
        'product_widgets/2',
        request: {
          body: {
            design_settings: {
              layout: new_layout
            }
          }
        },
        response: {
          body: "{\"id\": 2, \"design_settings\": {\"layout\": \"#{new_layout}\"}}"
        }
      )
    end

    it 'responds with new layout' do
      expect(
        client.update_product_widget(2, design_settings: {layout: new_layout}).design_settings.layout
      ).to eq(new_layout)
    end
  end
end
