module CzPayrollee5
  class SalaryMonthlyConcept < PayrollConcept
    attr_reader :amount_monthly

    def initialize(article_code, values)
      super(ConceptConstants.REF_SALARY_MONTHLY, article_code)
      init_values(values)
    end

    def init_values(values)
      @amount_monthly = ValueExtractor.get_valid_or_zero_int(values, :amount_monthly)
    end

    def spec_values
      %w(amount_monthly)
    end

    def pending_articles
      [
          HoursWorkingArticle.new,
          HoursAbsenceArticle.new
      ]
    end

    def summary_articles
      [
          IncomeGrossArticle.new
      ]
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_AMOUNT
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
