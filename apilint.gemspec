# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apilint/version'

Gem::Specification.new do |spec|
  spec.name          = "apilint"
  spec.version       = Apilint::VERSION
  spec.authors       = ["Raimon Grau", "Toni Reina"]
  spec.email         = ["raimon@3scale.net", "areina0@gmail.com"]
  spec.summary       = "Automatic API style checking tool."
  spec.description   = <<-EOF
Automatic API style checking tool.
It tries to validate your API requests/responses with some lints based on
different API style guides.
EOF
  spec.homepage      = "http://kidd.github.io/apilint"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19", ">= 0.19.1"
  spec.add_dependency "nokogiri", "~> 1.6", ">= 1.6.6"
  spec.add_dependency "activesupport", "~> 4.2", ">= 4.2.0"
  spec.add_dependency "json-minify", "~> 0.0", ">= 0.0.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.4", ">= 10.4.2"
  spec.add_development_dependency "pry", "~> 0.10", ">= 0.10.1"
  spec.add_development_dependency "pry-byebug", "~> 3.0", ">= 3.0.1"
  spec.add_development_dependency "pry-doc", "~> 0.6", ">= 0.6.0"
  spec.add_development_dependency "rspec", "~> 3.2", ">= 3.2.0"
end
