# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rotten_tomatoes_api/version"

Gem::Specification.new do |s|
  s.name        = "rotten_tomatoes_api"
  s.version     = RottenTomatoesApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stefan Frank"]
  s.email       = ["s.frank@vierundsechzig.de"]
  s.homepage    = ""
  s.summary     = %q{Searching for movies using the Rotten Tomatoes-API}
  s.description = %q{The gem accesses the rotten-tomatoes-Site using their API, http://developer.rottentomatoes.com/}

  s.rubyforge_project = "rotten_tomatoes_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httparty'


  s.add_development_dependency "rspec"
end
