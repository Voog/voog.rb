require 'spec_helper'

describe Edicy do
  
  describe '.configure' do
    
    it 'sets site' do
      Edicy.configure do |config|
        config.site = 'edicy.local'
      end
      
      expect(Edicy.site).to eq('edicy.local')
    end
    
    it 'sets api token' do
      Edicy.configure do |config|
        config.api_token = 'afcf30182aecfc8155d390d7d4552d14'
      end
      
      expect(Edicy.api_token).to eq('afcf30182aecfc8155d390d7d4552d14')
    end
  end

  describe '.client' do
    
    before do
      Edicy.configure do |config|
        config.site = 'edicy.local'
        config.api_token = 'afcf30182aecfc8155d390d7d4552d14'
      end
    end
    
    it 'creates Edicy::Client' do
      expect(Edicy.client).to be_kind_of(Edicy::Client)
    end
  end

end
