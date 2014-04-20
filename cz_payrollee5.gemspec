# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cz_payrollee5/version'

Gem::Specification.new do |spec|
  spec.name          = "cz_payrollee5"
  spec.version       = CzPayrollee5::VERSION
  spec.authors       = ["Ladislav Lisy"]
  spec.email         = ["ladislav.lisy@seznam.cz"]
  spec.description   = %q{
    Simple gem for calculation basic Czech Payroll
  }
  spec.summary       = %q{
     There are included in this gem:
     Employment Terms
     Agreement Terms
     Position Terms
     working schedule by weekly hours
     absence hours
     monthly salary
     tax income base
     tax advance
     withholding tax
     health and social assessment base
     health and social insurance
     pension savings
     tax reliefs for payer
     tax reliefs for disability
     tax reliefs for studying
     tax reliefs for child
     tax bonus for child
     gross income
     net income
  }
  spec.homepage      = "https://github.com/ladislavlisy/cz_payrollee5"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "rspec-expectations"
end
