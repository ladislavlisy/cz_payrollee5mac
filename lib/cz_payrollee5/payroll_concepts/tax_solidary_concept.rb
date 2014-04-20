module CzPayrollee5
  class TaxSolidaryConcept < PayrollConcept

    def initialize(article_code, values)
      super(ConceptConstants.REF_TAX_SOLIDARY, article_code)
      init_values(values)
    end

    def init_values(values)
    end

    def spec_values
      []
    end

    def pending_articles
      [
          TaxSolidaryBaseArticle.new
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_NETTO
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
