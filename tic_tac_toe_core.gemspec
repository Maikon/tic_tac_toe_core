# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe_core/version'

Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe_core"
  spec.version       = TicTacToeCore::VERSION
  spec.authors       = ["Makis Otman"]
  spec.email         = ["makisotman@gmail.com"]
  spec.summary       = %q{Core functionality of the TicTacToe Game which can be used with a variety of interfaces.}
  spec.homepage      = "https://github.com/Maikon/tic_tac_toe_core"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
