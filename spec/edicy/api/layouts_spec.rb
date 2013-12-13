require 'spec_helper'

describe Edicy::API::Layouts do
  
  before do
    @client = edicy_client
  end
  
  describe '#layouts' do
    before do
      stub_request(:get, 'http://edicy.test/admin/api/layouts').
        with(headers: {'X-Api-Token' => 'afcf30182aecfc8155d390d7d4552d14'}).
        to_return(body: fixture('layouts/layouts'))
    end
    
    # TODO: These specs are joke, replace them with REAL specs
    it 'returns all layouts' do
      expect(@client.layouts.length).to eql(1)
    end
    
    it 'returns best layout ever made' do
      expect(@client.layouts.first.title).to eql('My layout')
    end
  end
end
