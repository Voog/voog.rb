# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edicy_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'edicy-api'
  spec.version       = Edicy::VERSION
  spec.authors       = ['Priit Haamer', 'Mikk Pristavka']
  spec.email         = ['priit@edicy.com', 'mikk@fraktal.ee']
  spec.description   = %q{Best API wrapper for the best website builder}
  spec.summary       = %q{Ruby toolkit for the Edicy API}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'guard-rspec', '~> 4.2.0'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'webmock', '~> 1.16.0'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'rest-client'
end
