# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voog_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'voog_api'
  spec.version       = Voog::VERSION
  spec.authors       = ['Priit Haamer', 'Mikk Pristavka', 'Tanel Jakobsoo']
  spec.email         = ['priit@edicy.com', 'mikk@fraktal.ee', 'tanel@fraktal.ee']
  spec.description   = %q{Best API wrapper for the best website builder}
  spec.summary       = %q{Ruby toolkit for the Voog API}
  spec.homepage      = 'https://github.com/Edicy/voog.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'guard-rspec', '~> 4.2.0'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'webmock', '1.16.0'
  spec.add_development_dependency 'rake'
  
  spec.add_dependency 'sawyer', '~> 0.5.4'
end
