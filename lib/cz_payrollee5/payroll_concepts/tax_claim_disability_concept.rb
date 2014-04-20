module CzPayrollee5
  class TaxClaimDisabilityConcept < PayrollConcept
    attr_reader :relief_level_1_code, :relief_level_2_code, :relief_level_3_code

    def initialize(article_code, values)
      super(ConceptConstants.REF_TAX_CLAIM_DISABILITY, article_code)
      init_values(values)
    end

    def init_values(values)
      @relief_level_1_code = ValueExtractor.get_valid_or_zero_int(values, :relief_level_1_code)
      @relief_level_2_code = ValueExtractor.get_valid_or_zero_int(values, :relief_level_2_code)
      @relief_level_3_code = ValueExtractor.get_valid_or_zero_int(values, :relief_level_3_code)
    end

    def spec_values
      %w(relief_level_1_code relief_level_2_code relief_level_3_code)
    end

    def pending_articles
      [
          TaxIncomeArticle.new
      ]
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
