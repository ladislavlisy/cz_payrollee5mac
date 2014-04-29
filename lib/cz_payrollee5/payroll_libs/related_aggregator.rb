module CzPayrollee5
  class RelatedAggregator
    def self.collect_articles_to_evaluate(factors)
      factors_copy = factors.dup

      initial_to_evaluate = []

      articles_to_evaluate = factors_copy.inject(initial_to_evaluate) do |agr, factor_pair|
        self.concept_articles_to_evaluate(agr, factor_pair.last)
      end

      uniquely_to_evaluate = articles_to_evaluate.uniq

      return uniquely_to_evaluate
    end

    def self.concept_articles_to_evaluate(articles_evaluate, concept)
      related_arry = concept.related_articles

      if related_arry.nil?
        return articles_evaluate.dup
      end

      return articles_evaluate.concat(related_arry)
    end
  end
end
