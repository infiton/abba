# -*- encoding: utf-8 -*-
require File.expand_path('../lib/abba/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'abba'
  s.version = ABBA::VERSION
  s.date = '2016-12-04'
  s.summary = 'Bayesian A/B Testing'
  s.authors = ['Kyle Tate']
  s.email = 'kbt.tate@gmail.com'
  s.files = Dir.glob("{lib}/**/*")

  s.require_paths = ["lib"]
  
  s.add_development_dependency 'minitest', '~>5.8'
  s.add_development_dependency 'rake', '~>10.0'

  s.homepage    = 'http://github.com/infiton/abba'
  s.license     = 'MIT'
end