$:.push File.expand_path("../lib", __FILE__)
require "code_generator/version"

Gem::Specification.new do |s|
  s.name          = 'code_generator'
  s.version       = CodeGenerator::VERSION
  s.date          = '2013-06-05'
  s.summary       = "An alpha-numeric code generator"
  s.description   = "An alpha-numeric code generator"
  s.authors       = ["Bharat Gupta"]
  s.email         = 'bindassbharat311@gmail.com'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage      = 'https://github.com/Bharat311/code_generator'
end