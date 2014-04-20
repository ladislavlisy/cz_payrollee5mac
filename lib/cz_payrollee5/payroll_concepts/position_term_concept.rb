module CzPayrollee5
  class PositionTermConcept < PayrollConcept
    attr_reader :start_date, :end_date

    def initialize(article_code, values)
      super(ConceptConstants.REF_POSITION_TERM, article_code)
      init_values(values)
    end

    def init_values(values)
      @start_date = ValueExtractor.get_valid_or_zero_date(values, :start_date, nil)
      @end_date = ValueExtractor.get_valid_or_zero_date(values, :end_date, nil)
    end

    def spec_values
      %w(start_date end_date)
    end

    def pending_articles
      [
          EmploymentTermArticle.new
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_TERMS
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
