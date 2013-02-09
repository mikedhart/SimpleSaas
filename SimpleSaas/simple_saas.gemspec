$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_saas/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_saas"
  s.version     = SimpleSaas::VERSION
  s.authors     = ["Mike Hart"]
  s.email       = ["info@mikedhart.co.uk"]
  s.homepage    = "https://github.com/mikedhart/SimpleSaas"
  s.summary     = "Skeleton Saas App"
  s.description = "Skeleton Saas App"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2", "~> 0.3.11"
end