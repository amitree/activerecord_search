module ActiverecordSearch
  class Term
    def initialize(condition)
      @pattern = case condition
      when nil
        raise "Condition can't be nil"
      when Hash
        key, value = condition.first if condition.length == 1
        case key.to_sym
        when :starts_with
          "#{value}%"
        when :ends_with
          "%#{value}"
        when :like
          "#{value}"
        else
          raise 'Expected hash to contain exactly one of these keys: "starts_with", "ends_with", or "like"' unless key.in? %i(starts_with ends_with like)
        end
      else
        "%#{condition}%"
      end
    end

    def match(attribute)
      attribute.matches(@pattern)
    end
  end
end
