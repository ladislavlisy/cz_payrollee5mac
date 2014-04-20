module CzPayrollee5
  class TaxIncomeConcept < PayrollConcept
    attr_reader :liability_code, :residency_code, :statement_code

    def initialize(article_code, values)
      super(ConceptConstants.REF_TAX_INCOME, article_code)
      init_values(values)
    end

    def init_values(values)
      @liability_code = ValueExtractor.get_valid_or_zero_int(values, :liability_code)
      @residency_code = ValueExtractor.get_valid_or_zero_int(values, :residency_code)
      @statement_code = ValueExtractor.get_valid_or_zero_int(values, :statement_code)
    end

    def spec_values
      %w(liability_code residency_code statement_code)
    end

    def pending_articles
      [
          InsuranceHealthArticle.new,
          InsuranceSocialArticle.new,
          SavingPensionArticle.new
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_GROSS
    end

    def evaluate(setup, results)
       UnknownResult.new(article_code, code, self)
    end

    def compute_result_value(setup, results)
      result_value = 0
    end

    def clone_with_value(article_code, values)
      other_concept = self.dup
      other_concept.init_code(article_code)
      other_concept.init_values(values)
      return other_concept
    end
  end
end
