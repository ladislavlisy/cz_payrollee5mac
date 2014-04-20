module CzPayrollee5
  class XXXConcept < PayrollConcept
    attr_reader :value

    def initialize
      super(ConceptConstants.REF_###, ArticleCode.ARTICLE_UNKNOWN)
    end

    def init_values(values)
      @value = ValueExtractor.get_valid_or_zero_int(values, :value)
    end

    def spec_values
      %w(value)
    end

    def pending_articles
      [
      ]
    end

    def summary_articles
      [
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_START
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