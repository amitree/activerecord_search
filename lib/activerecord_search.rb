require 'activerecord_search/term'
require 'activerecord_search/predicate_handler'
require 'activerecord_search/railtie'

def Search(condition)
  ActiverecordSearch::Term.new(condition) unless condition.nil?
end
