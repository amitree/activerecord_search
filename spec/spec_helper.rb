require 'rails/all'
require 'activerecord_search'

ActiveRecord::Base.establish_connection(
    adapter:  'sqlite3',
    database: ':memory:'
)

ActiverecordSearch::Railtie.run_initializers
