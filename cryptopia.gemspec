lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cryptopia/version"

Gem::Specification.new do |spec|
  spec.name          = "cryptopia"
  spec.version       = Cryptopia::VERSION
  spec.authors       = ["Bruno Arueira"]
  spec.email         = ["contato@brunoarueira.com"]

  spec.summary       = %q{Cryptopia wrapper api}
  spec.description   = %q{Cryptopia wrapper api}
  spec.homepage      = "https://github.com/brunoarueira/cryptopia"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "= 0.16.4"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "4.0.0"
  spec.add_development_dependency "pry"
end
