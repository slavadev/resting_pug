$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_rest_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_rest_api"
  s.version     = SimpleRestAPI::VERSION
  s.authors     = ["Slava Korolev"]
  s.email       = ["korolvs@gmail.com"]
  s.homepage    = "https://github.com/korolvs/simple_rest_api"
  s.summary     = "Summary of SimpleRestApi."
  s.description = "Description of SimpleRestApi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rails", "~> 5.1.2"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'shoulda-matchers'
end
