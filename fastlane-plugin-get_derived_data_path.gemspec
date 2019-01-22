lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/get_derived_data_path/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-get_derived_data_path'
  spec.version       = Fastlane::GetDerivedDataPath::VERSION
  spec.author        = 'Rajiv Shah'
  spec.email         = 'rajivshah1@icloud.com'

  spec.summary       = 'Retrieves the path of a workspace in DerivedData'
  spec.homepage      = 'https://github.com/rajivshah3/fastlane-plugin-get_derived_data_path'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.110.0')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '0.63.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
