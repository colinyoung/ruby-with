# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-with/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-with"
  gem.version       = Ruby::With::VERSION
  gem.authors       = ["Colin Young"]
  gem.email         = ["me@colinyoung.com"]
  gem.description   = %q{Seamlessly make any object the current context}
  gem.summary       = %q{A hack of instance_exec that I feel is missing from ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
