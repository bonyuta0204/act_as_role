require_relative 'lib/act_as_role/version'

Gem::Specification.new do |spec|
  spec.name          = "act_as_role"
  spec.version       = ActAsRole::VERSION
  spec.authors       = ["Yuta Nakamura"]
  spec.email         = ["nakamurayuta0204@gmail.com"]

  spec.summary       = %q{Act as role}
  spec.description   = %q{Use activerecord for role control}
  spec.homepage      = "https://github.com/bonyuta0204/act_as_role"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bonyuta0204/act_as_role"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]


    spec.add_runtime_dependency 'activerecord', '>= 6.0.0'
      spec.add_development_dependency 'pry'
        spec.add_development_dependency 'rspec-rails', '~> 4.0.0'
      spec.add_development_dependency 'sqlite3'


end
