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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
