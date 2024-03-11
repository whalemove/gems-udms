# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'udms/version'

Gem::Specification.new do |spec|
  spec.name          = "udms"
  spec.version       = Udms::VERSION
  spec.authors       = ["Lansy peng"]
  spec.email         = ["lansy.peng@optilinktech.com"]
  spec.summary       = %q{provide methord of getting config data}
  spec.description   = %q{1.Udms::ServiceEndpoint.get_service_endpoint}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         =`git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activeresource", '4.0.0'
  spec.add_development_dependency 'redis-rails','5.0.2'
end
