require 'activerecord_search/term'
require 'activerecord_search/railtie'

def Search(*args)
  ActiverecordSearch::Term.new(*args)
end
