require_relative 'lib/tennis_center_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "tennis_center_gem"
  spec.version       = TennisCenterGem::VERSION
  spec.authors       = ["pete3249"]
  spec.email         = ["katelynrpeterson16@gmail.com"]

  spec.summary       = %q{Tennis Center CLI Gem}
  spec.description   = %q{Locate details of tennis centers within a certain zip code.}
  spec.homepage      = "https://github.com/pete3249/tennis_center_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = ["tennis_center_cli"]
  spec.require_paths = ["lib"]
  
  #spec.add_dependency "http"
  # spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
