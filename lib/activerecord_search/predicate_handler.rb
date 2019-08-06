module ActiverecordSearch
  module PredicateHandler
    def predicate_builder
      return @local_predicate_builder if @local_predicate_builder
      @local_predicate_builder = super
      @local_predicate_builder.register_handler(::ActiverecordSearch::Term, ->(attribute, search_term) { search_term.match(attribute) })

      @local_predicate_builder
    end
  end
end
