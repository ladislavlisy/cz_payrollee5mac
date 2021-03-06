module CzPayrollee5
  class PaymentIncomeResult < PayrollResult
    attr_reader :value

    def initialize(article_code, concept_code, concept, values)
      super(article_code, concept_code, concept)
      setup_values(values)
    end

    def setup_values(values)
      @value = ValueExtractor.get_valid_or_zero_int(values, :value)
    end
  end
end
