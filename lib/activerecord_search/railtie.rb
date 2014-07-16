module ActiverecordSearch
  class Railtie < ::Rails::Railtie
    initializer "PredicateBuilder" do
      ActiveRecord::PredicateBuilder.register_handler(::ActiverecordSearch::Term, ->(attribute, search_term) { search_term.match(attribute) })
    end
  end
end
