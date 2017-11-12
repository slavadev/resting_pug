$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resting_pug/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resting_pug"
  s.version     = RestingPug::VERSION
  s.authors     = ["Slava Korolev"]
  s.email       = ["korolvs@gmail.com"]
  s.homepage    = "https://korolvs.github.io/resting_pug/"
  s.summary     = "A simple and fully customizable way to create an API in your Rails application."
  s.description = "Resting Pug allows you to create a JSON API with just adding one line to your controller and fully customize it with overriding small and simple helper methods."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_runtime_dependency 'will_paginate', '~> 3'
  s.add_development_dependency 'rails', '~> 5.1'
  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.6'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'factory_girl', '~> 4.8'
  s.add_development_dependency 'faker', '~> 1.8'
  s.add_development_dependency 'codecov', '~> 0'
end
