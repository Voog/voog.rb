require 'voog_api'
require 'webmock/rspec'
require 'pathname'

WebMock.disable_net_connect!

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

def voog_client
  Voog.configure do |config|
    config.host = 'voog.test'
    config.api_token = 'afcf30182aecfc8155d390d7d4552d14'
  end
  Voog.client
end

def fixture(file)
  File.read(File.expand_path('../fixtures', __FILE__) + '/' + file + '.json')
end

def request_fixture(method, path, options = {})
  request = {
    headers: {
      'X-API-TOKEN' => 'afcf30182aecfc8155d390d7d4552d14'
    }
  }

  response = ({headers: {'Content-Type' => 'application/json'}}).tap { |response|
    response[:body] = fixture(options[:fixture]) if options.has_key?(:fixture)
  }.merge(options.fetch(:response, {}))

  stub_request(method, voog_url(path)).with(request).to_return(response)
end

def voog_url(path)
  "http://voog.test/admin/api/#{path}"
end
