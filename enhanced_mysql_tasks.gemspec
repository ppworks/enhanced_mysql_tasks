lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enhanced_mysql_tasks/version'

Gem::Specification.new do |spec|
  spec.name          = "enhanced_mysql_tasks"
  spec.version       = EnhancedMysqlTasks::VERSION
  spec.authors       = ["ppworks"]
  spec.email         = ["koshikawa@ppworks.jp"]

  spec.summary       = %q{Enhanced MySQL tasks for Rails}
  spec.description   = %q{This gem provides clean db/structure.sql.}
  spec.homepage      = "https://github.com/ppworks/enhanced_mysql_tasks"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', ['>= 4.1.0', '< 6']
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "mocha", "~> 1.1.0"
end
