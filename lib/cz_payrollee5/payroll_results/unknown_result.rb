module CzPayrollee5
  class UnknownResult < PayrollResult
    def initialize(article_code, concept_code, concept)
      super(article_code, concept_code, concept)
    end
  end
end
