Gem::Specification.new do |s|
  s.name        = 'activerecord_search'
  s.version     = '1.3'
  s.date        = '2019-06-13'
  s.summary     = "An easy way to write LIKE / ILIKE queries for Active Record models"
  s.description = "Extends the ActiveRecord predicate builder to allow writing LIKE/ILIKE queries without writing raw SQL"
  s.authors     = ["Tony Novak", "Nick Hance"]
  s.email       = 'tony@amitree.com'
  s.files       = Dir["{lib,spec,vendor}/**/*", "[A-Z]*"] - ["Gemfile.lock"]

  s.homepage    = 'http://rubygems.org/gems/activerecord_search'
  s.license     = 'MIT'

  s.add_runtime_dependency "activerecord", ">= 5.0", "< 5.2"
  s.add_runtime_dependency "rails", ">= 5.0", "< 5.2"
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
  s.add_development_dependency 'rspec-rails', '>= 3.0.0.beta'
end
