$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "converters_before_validation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "converters_before_validation"
  spec.version     = ConvertersBeforeValidation::VERSION
  spec.authors     = ["Kanaikin Slava"]
  spec.email       = ["sportix@gotar.ru"]
  spec.homepage    = "https://github.com/slavik117/converters_before_validation"
  spec.summary     = "Formatters for ActiveRecord attributes by before_validation callback"
  spec.description = "Adds before_validation callback, which applies necessary function to attributes. There are some derivatives: squish_before_validation_for, downcase_before_validation_for, upcase_before_validation_for."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'activesupport', ['>= 5.0.0', '< 7.0.0']
  spec.add_dependency 'activerecord', ['>= 5.0.0', '< 7.0.0']

  spec.add_development_dependency 'rails', '~> 6.0.0'
  spec.add_development_dependency 'sqlite3'
end
