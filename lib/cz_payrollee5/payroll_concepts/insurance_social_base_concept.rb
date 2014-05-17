module CzPayrollee5
  class InsuranceSocialBaseConcept < PayrollConcept
    attr_reader :liability_code, :minimum_amount

    def initialize(article_code, values)
      super(ConceptConstants::REF_INSURANCE_SOCIAL_BASE, article_code)
      init_values(values)
    end

    def init_values(values)
      @liability_code = ValueExtractor.get_valid_or_zero_int(values, :liability_code)
      @minimum_amount = ValueExtractor.get_valid_or_zero_int(values, :minimum_amount)
    end

    def spec_values
      %w(liability_code minimum_amount)
    end

    def pending_articles
      [
          SubjectsInsSocialArticle.new
      ]
    end

    def calc_category
      TypeCategory::CALC_CATEGORY_GROSS
    end

    def evaluate(config, token, results)
      result_party = token.get_party
      result_token = token

      Hash[result_token, UnknownResult.new(article_code, code, self)]
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
