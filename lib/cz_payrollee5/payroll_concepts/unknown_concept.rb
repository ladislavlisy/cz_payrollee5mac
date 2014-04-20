module CzPayrollee5
  class UnknownConcept < PayrollConcept

    def initialize
      super(ConceptConstants.REF_UNKNOWN, ArticleCode.ARTICLE_UNKNOWN)
    end

    def init_values(values)
    end

    def evaluate(setup, results)
      UnknownResult.new(article_code, code, self)
    end

    def clone_with_value(article_code, values)
      other_concept = self.dup
      other_concept.init_code(article_code)
      other_concept.init_values(values)
      return other_concept
    end
  end
end
