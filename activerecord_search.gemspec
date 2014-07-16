Gem::Specification.new do |s|
  s.name        = 'activerecord_search'
  s.version     = '1.1'
  s.date        = Date.today.to_s
  s.summary     = "An easy way to write LIKE / ILIKE queries for Active Record models"
  s.description = "Extends the ActiveRecord predicate builder to allow writing LIKE/ILIKE queries without writing raw SQL"
  s.authors     = ["Tony Novak"]
  s.email       = 'tony@amitree.com'
  s.files       = Dir["{lib,spec,vendor}/**/*", "[A-Z]*"] - ["Gemfile.lock"]

  s.homepage    = 'http://rubygems.org/gems/activerecord_search'
  s.license     = 'MIT'

  s.add_runtime_dependency 'activerecord', '>= 4.0.0'
  s.add_runtime_dependency 'rails', '>= 4.0.0'
  s.add_development_dependency 'rspec-rails', '>= 3.0.0.beta'
end
