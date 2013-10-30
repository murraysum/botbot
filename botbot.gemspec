# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'botbot/version'

Gem::Specification.new do |spec|
  spec.name          = "botbot"
  spec.version       = Botbot::VERSION
  spec.authors       = ["Murray Summers"]
  spec.email         = ["murray.sum@gmail.com"]
  spec.description   = "a little robot"
  spec.summary       = "a little robot summary"
  spec.homepage      = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
