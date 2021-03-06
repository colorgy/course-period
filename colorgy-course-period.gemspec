# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colorgy/course_period/version'

Gem::Specification.new do |spec|
  spec.name          = "colorgy-course-period"
  spec.version       = Colorgy::CoursePeriod::VERSION
  spec.authors       = ["Yukai Huang"]
  spec.email         = ["yukai@colorgy.io"]

  spec.summary       = "Colorgy CoursePeriod"
  spec.description   = "Colorgy CoursePeriod"
  spec.homepage      = "https://github.com/colorgy/course-period"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/colorgy"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry",   "~> 0.10"
  spec.add_development_dependency "rubocop", "~> 0.36"
end
