# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voog_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'voog_api'
  spec.version       = Voog::VERSION
  spec.authors       = ['Priit Haamer', 'Mikk Pristavka', 'Tanel Jakobsoo', 'Peeter Paal']
  spec.email         = ['priit@edicy.com', 'mikk@voog.com', 'tanel@voog.com', 'peeter@voog.com']
  spec.description   = %q{Best API wrapper for the best website builder}
  spec.summary       = %q{Ruby toolkit for the Voog API}
  spec.homepage      = 'https://github.com/Voog/voog.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'guard-rspec', '~> 4.2.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.18'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'sawyer', '~> 0.9'
  spec.add_dependency 'faraday', '>= 0.9', '< 3'
  spec.add_dependency 'faraday-multipart', '> 0' if RUBY_VERSION >= '2.4'
end
