# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine_api/version_number'

Gem::Specification.new do |spec|
  spec.name          = "redmine_api"
  spec.version       = RedmineApi::VERSION
  spec.authors       = ["Yuta Shibabuki"]
  spec.email         = ["yuta.s1113@gmail.com"]

  spec.summary       = %q{Rubygem to access Redmine API}
  spec.homepage      = "https://github.com/yuta1113/redmine_api"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activeresource", "= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
