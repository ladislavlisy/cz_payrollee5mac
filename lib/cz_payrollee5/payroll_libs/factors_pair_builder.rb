module CzPayrollee5
  class FactorsPairBuilder
    def self.pair_by_symbol_providing_order(party, article_symbol, code_order, article_values, config)
      concept = self.concept_by_symbol(article_symbol, article_values, config)

      key = self.key_providing_order(party, concept.article_code, code_order)

      return [key, concept]
    end

    def self.pair_by_code_providing_order(party, article_code, code_order, article_values, config)
      concept = self.concept_by_code(article_code, article_values, config)

      key = self.key_providing_order(party, concept.article_code, code_order)

      return [key, concept]
    end

    def self.key_providing_order(party, article_code, code_order)
      term_key = TermOrder.new(party, article_code, code_order)
      return term_key
    end

    def self.concept_by_symbol(article_symbol, article_values, config)
      fact_concept = self.concept_by_code(article_symbol.code, article_values, config)
      return fact_concept
    end

    def self.concept_by_code(article_code, article_values, config)
      fact_article = config.find_article(article_code)

      base_concept = config.find_concept(fact_article.concept_code)

      fact_concept = base_concept.clone_with_value(fact_article.code, article_values)

      return fact_concept
    end
  end
end

