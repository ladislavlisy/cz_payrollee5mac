module CzPayrollee5
  class PayrollArticle < Symbolic
    attr_reader :concept

    def initialize(article_symbol, concept)
      super(article_symbol.code, article_symbol.name)
      @concept = concept
    end

    def title
      name
    end

    def description
      name
    end

    def concept_code
      concept.code
    end

    def concept_description
      concept.name
    end

    def insurance_health?
      false
    end

    def insurance_social?
      false
    end

    def tax_income?
      false
    end

    def income_gross?
      false
    end

    def income_netto?
      false
    end

    def deduction_netto?
      false
    end
  end
end

