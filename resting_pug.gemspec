$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resting_pug/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resting_pug"
  s.version     = RestingPug::VERSION
  s.authors     = ["Slava Korolev"]
  s.email       = ["korolvs@gmail.com"]
  s.homepage    = "https://github.com/korolvs/resting_pug"
  s.summary     = "Summary of RestingPug."
  s.description = "Description of RestingPug."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_runtime_dependency 'will_paginate'
  s.add_development_dependency "rails", "~> 5.1.2"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'faker'
end
