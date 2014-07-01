require 'spec_helper'

describe Voog do
  
  describe '.configure' do
    
    it 'sets host' do
      Voog.configure do |config|
        config.host = 'voog.local'
      end
      
      expect(Voog.host).to eq('voog.local')
    end
    
    it 'sets api token' do
      Voog.configure do |config|
        config.api_token = 'afcf30182aecfc8155d390d7d4552d14'
      end
      
      expect(Voog.api_token).to eq('afcf30182aecfc8155d390d7d4552d14')
    end
  end

  describe '.client' do
    
    before do
      Voog.configure do |config|
        config.host = 'voog.local'
        config.api_token = 'afcf30182aecfc8155d390d7d4552d14'
      end
    end
    
    it 'creates Voog::Client' do
      expect(Voog.client).to be_kind_of(Voog::Client)
    end
  end

end
