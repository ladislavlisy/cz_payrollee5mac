module CzPayrollee5
  class PayrollConcept < Symbolic
    attr_reader :article_code, :related_articles

    def initialize(concept_symbol, article_code)
      super(concept_symbol.code, concept_symbol.name)
      @article_code = article_code
      @related_articles = nil
    end

    def init_code(article_code)
      @article_code = article_code
    end

    def description
      name
    end

    def set_related_articles(articles)
      @related_articles = articles.dup
    end

    def pending_articles
      []
    end

    def summary_articles
      []
    end

    def calc_category
      TypeCategory.CALC_CATEGORY_START
    end

    def calc_category_text
      TypeCategory.to_s(calc_category)
    end

    def spec_values
      []
    end

    def evaluate(config, token, results)
    end

    def <=>(concept_other)
      return ConceptComparer.concept_compare(self, concept_other)
    end

    def get_contract_party(fact_token)
        return nil
    end

    def get_position_party(fact_token)
      return nil
    end

    def get_factor_parties(contracts, positions)
      return Array(TermParty.get_empty)
    end
  end
end

