# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/restful/version'

Gem::Specification.new do |s|
  s.name        = 'sinatra-restful'
  s.version     = Sinatra::Restful::VERSION
  s.license     = 'MIT'

  s.summary     = "Simple extension for writing modular RESTful sinatra apps."
  s.description = "Sinatra::Restful is a simple gem that helps you writing modular RESTful APIs in Sinatra."

  s.authors     = ["Patryk Pastewski"]
  s.email       = 'past.patryk@gmail.com'
  s.homepage    = 'http://github.com/pastDexter/sinatra-restful'


  all_files       = `git ls-files -z`.split("\x0")
  s.files         = all_files.grep(%r{^(bin|lib)/})
  s.executables   = all_files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency('sinatra', '~> 1.4')
end
