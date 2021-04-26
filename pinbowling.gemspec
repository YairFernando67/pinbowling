# frozen_string_literal: true

require_relative "lib/pinbowling/version"

Gem::Specification.new do |spec|
  spec.name          = "pinbowling"
  spec.version       = Pinbowling::VERSION
  spec.authors       = ["yairfacio"]
  spec.email         = ["yair.facio11@gmail.com"]

  spec.summary       = "Command line tool to score a game of ten-pin bowling"
  spec.description   = "Pin Bowling is a command like tool to score games"
  spec.homepage      = "https://github.com/YairFernando67/pinbowling"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/YairFernando67/pinbowling"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/YairFernando67/pinbowling"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~>6.0"
  spec.add_dependency "dry-container", "~> 0.7.2"
  spec.add_dependency "pry", "~> 0.14.1"
  spec.add_dependency "thor", "~> 1.1"
  spec.add_dependency "zeitwerk", "~> 2.4", ">= 2.4.2"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop", "0.77.0"
end
