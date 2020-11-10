# frozen_string_literal: true
require_relative 'lib/rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Dushyant Singh Shekhawat"]
  spec.email         = ["contact@dushyantss.com"]

  spec.summary       = 'A much simpler rails. Building for learning purposes.'
  spec.description   = 'A much simpler rails. Building for learning purposes.'
  spec.homepage      = "https://github.com/dushyantss/rulers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dushyantss/rulers.git"
  spec.metadata["changelog_uri"] = "https://github.com/dushyantss/rulers/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_runtime_dependency "rack"

  # Dev Dependencies
  # Rubocop for linting and formatting
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-shopify'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'sorbet'
  # Solargraph for intellisense
  spec.add_development_dependency 'solargraph'
end
