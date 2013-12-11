# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edicy/version'

Gem::Specification.new do |spec|
  spec.name          = 'edicy'
  spec.version       = Edicy::VERSION
  spec.authors       = ['Priit Haamer']
  spec.email         = ['priit@fraktal.ee']
  spec.description   = %q{Best API wrapper for the best website builder}
  spec.summary       = %q{Ruby toolkit for the Edicy API}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
