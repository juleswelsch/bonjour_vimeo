# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bonjour_vimeo/version'

Gem::Specification.new do |spec|
  spec.name          = "bonjour_vimeo"
  spec.version       = BonjourVimeo::VERSION
  spec.authors       = ["juleswelsch"]
  spec.email         = ["jules@wgroupe.com"]
  spec.description   = %q{Rails Vimeo API}
  spec.summary       = %q{simply Viemo API implementation for Rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency('httparty', '~> 0.13.0')

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
