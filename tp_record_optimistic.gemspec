# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tp_cached_record/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tp_cached_record'
  s.version     = TPCachedRecord::VERSION
  s.authors     = ['Fabricio Oliveira']
  s.email       = ['fabricio.oliveira@m4u.com.br']
  s.summary       = 'gem thas implement optimistic uuid'
  s.homepage      = 'https://github.com/fabricio-oliveira/tp_optimistic-uuid'
  s.license       = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency 'rails', '~> 4'
  s.add_dependency 'connection_pool', '~> 2.2.1'
  s.add_development_dependency 'mock_redis', '0.18.0'
  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'simplecov', '~> 0.13.0'
  s.add_development_dependency 'simplecov-rcov', '~> 0.2.3'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8'
  s.add_development_dependency 'faker', '~> 1.7'
  s.add_development_dependency 'rubocop', '~> 0.47.1'
  s.add_development_dependency 'sqlite3', '~> 1.0'
  s.add_development_dependency 'annotate', '~> 2.7'
end
