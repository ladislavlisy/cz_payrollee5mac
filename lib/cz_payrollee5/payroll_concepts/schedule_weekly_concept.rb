module CzPayrollee5
  class ScheduleWeeklyConcept < PayrollConcept
    attr_reader :schedule_type, :hours_weekly

    def initialize(article_code, values)
      super(ConceptConstants.REF_SCHEDULE_WEEKLY, article_code)
      init_values(values)
    end

    def init_values(values)
      @schedule_type = ValueExtractor.get_valid_or_zero_int(values, :schedule_type)
      @hours_weekly = ValueExtractor.get_valid_or_zero_int(values, :hours_weekly)
    end

    def spec_values
      %w(schedule_type hours_weekly)
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
