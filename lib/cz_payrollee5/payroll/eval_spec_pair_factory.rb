module CzPayrollee5
  class EvalSpecPairFactory
    def self.spec_pair_from_article_symbol_providing_order(group, article_symbol, code_order, article_values, setup)
      concept = self.concept_from_article_symbol(article_symbol, article_values, setup)

      key = self.spec_key_providing_order(group, concept.article_code, code_order)

      return [key, concept]
    end

    def self.spec_pair_from_article_code_providing_order(group, article_code, code_order, article_values, setup)
      concept = self.concept_from_article_code(article_code, article_values, setup)

      key = self.spec_key_providing_order(group, concept.article_code, code_order)

      return [key, concept]
    end

    def self.spec_key_providing_order(group, article_code, code_order)
      term_key = TermOrder.new(group, article_code, code_order)
      return term_key
    end

    def self.concept_from_article_symbol(article_symbol, article_values, setup)
      term_article = setup.article_from_models(article_symbol)

      base_concept = setup.article_concept_from_models(term_article)

      term_concept = base_concept.clone_with_value(term_article.code, article_values)

      return term_concept
    end

    def self.concept_from_article_code(article_code, article_values, setup)
      term_article = setup.find_article(article_code)

      base_concept = setup.find_concept(term_article.concept_code)

      term_concept = base_concept.clone_with_value(term_article.code, article_values)

      return term_concept
    end
  end
end

