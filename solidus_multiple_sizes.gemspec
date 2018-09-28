# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_multiple_sizes/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_multiple_sizes'
  s.version     = SolidusMultipleSizes::VERSION
  s.summary     = 'Enables adding of multiple sizes to product'
  s.description = 'Enables adding of multiple sizes to product.'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Raymond Usbal'
  s.email     = 'raymond@philippinedev.com'
  s.homepage  = 'https://github.com/rusbal'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '2.7.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
