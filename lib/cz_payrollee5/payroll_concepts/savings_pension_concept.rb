module CzPayrollee5
  class SavingsPensionConcept < PayrollConcept
    attr_reader :liability_code

    def initialize(article_code, values)
      super(ConceptConstants::REF_SAVINGS_PENSION, article_code)
      init_values(values)
    end

    def init_values(values)
      @liability_code = ValueExtractor.get_valid_or_zero_int(values, :liability_code)
    end

    def spec_values
      %w(liability_code)
    end

    def pending_articles
      [
          SavingsPensionBaseArticle.new
      ]
    end

    def summary_articles
      [
          IncomeNettoArticle.new
      ]
    end

    def calc_category
      TypeCategory::CALC_CATEGORY_NETTO
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
