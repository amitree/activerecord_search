module ActiverecordSearch
  class Railtie < ::Rails::Railtie
    initializer "PredicateBuilder" do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.singleton_class.send :prepend, ActiverecordSearch::PredicateHandler
      end
    end
  end
end
