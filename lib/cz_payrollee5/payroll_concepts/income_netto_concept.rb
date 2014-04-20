module CzPayrollee5
  class IncomeNettoConcept < PayrollConcept

    def initialize(article_code, values)
      super(ConceptConstants.REF_INCOME_NETTO, article_code)
      init_values(values)
    end

    def init_values(values)
    end

    def spec_values
      []
    end

    def pending_articles
      [
          IncomeGrossArticle.new,
          TaxAdvanceFinalArticle.new,
          TaxWithholdArticle.new,
          InsuranceHealthArticle.new,
          InsuranceSocialArticle.new
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_FINAL
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
