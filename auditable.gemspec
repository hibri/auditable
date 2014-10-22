$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auditable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auditable"
  s.version     = Auditable::VERSION
  s.authors     = ["Hibri Marzook"]
  s.email       = ["hibri@hibri.net"]
  s.homepage    = "http://www.hibri.net"
  s.summary     = "TODO: Summary of AuditTrail."
  s.description = "TODO: Description of AuditTrail."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
end
