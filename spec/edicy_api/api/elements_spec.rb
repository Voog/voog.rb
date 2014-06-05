require 'spec_helper'

describe Edicy::API::Elements do

  let(:client) { edicy_client }

  describe '#elements' do
    before do
      request_fixture(:get, 'elements', fixture: 'elements/elements')
    end

    it 'returns a list of elements' do
      expect(client.elements.length).to eql(2)
    end
  end

  describe '#element' do
    before do
      request_fixture(:get, 'elements/1', fixture: 'elements/element')
    end

    it 'returns a single element' do
      expect(client.element(1).title).to eq('Marilyn Monroe')
    end

    it 'returns a element with the same id as in the request' do
      expect(client.element(1).id).to eq(1)
    end
  end

  describe '#delete_element' do

    before do
      request_fixture(:delete, 'elements/2')
    end

    it 'calls delete method on element' do
      client.delete_element(2)
      assert_requested :delete, 'http://edicy.test/admin/api/elements/2'
    end
  end

  describe '#update_element' do

    before do
      request_fixture(:put, 'elements/2', request: {body: {title: 'Marilyn Monroe I'}}, response: {body: '{"id": 2, "title": "Marilyn Monroe I"}'})
    end

    it 'responds with new title' do
      expect(client.update_element(2, title: 'Marilyn Monroe I').title).to eq('Marilyn Monroe I')
    end
  end

  describe '#move_element' do

    before do
      request_fixture(:put, 'elements/1/move?page_id=2', response: {body: '{"id": 3, "page": {"id": 2}, "position": 1}'})
    end

    it 'responds with parent_id' do
      expect(client.move_element(1, page_id: 2).page.id).to eq(2)
    end
  end

  describe '#element_content' do
    before do
      request_fixture(:get, 'elements/1/contents/2', fixture: 'contents/content')
    end

    it 'returns a single content' do
      expect(client.content(Edicy::API::Contents::ParentKind::Element, 1, 2).name).to eq('slogan')
    end

    it 'returns a content with the same id as in the request' do
      expect(client.content(Edicy::API::Contents::ParentKind::Element, 1, 2).id).to eq(2)
    end
  end
end
