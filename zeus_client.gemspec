require File.expand_path('lib/zeus_client/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = "zeus_client"
  spec.version       = ZeusClient::VERSION
  spec.authors       = ["Eric Campbell"]
  spec.email         = ["ericcampbell59@gmail.com"]

  spec.summary       = %q{Ruby SDK for Zeus APIs}
  spec.description   = %q{Ruby SDK for Zeus APIs}
  spec.homepage      = "https://www.zeusdev.io"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ZeusHQ/zeus-client"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.require_paths = ["lib"]

  spec.files = Dir['README.md', 'LICENSE', 'CHANGELOG.md', 'lib/**/*.rb',
    'lib/**/*.rake', 'zeus_client.gemspec', '.github/*.md', 'Gemfile', 'Rakefile']

  spec.add_dependency("httparty", "~> 0.18.1")
  spec.add_dependency("activesupport", "~> 6.1.1")
  spec.add_dependency("jwt", "~> 2.2.2")
end
