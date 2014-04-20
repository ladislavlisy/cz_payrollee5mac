module CzPayrollee5
  class ArticleCollector
    def self.collect_pending_articles(source_concepts)
      source_concepts_copy = source_concepts.dup

      pending_articles = source_concepts_copy.inject([]) do |agr, term_key, term_concept|
        term_pending = term_concept.pending_articles
        agr.concat(self.collect_pending_deep(term_key, term_pending))
      end
      pending_unique = pending_articles.uniq

      return pending_unique
    end

    def self.collect_pending_deep(term, concept)
      pending_articles_copy = concept.collected_pending_articles

      if pending_articles_copy.nil?
        return []
      else
        return pending_articles_copy.dup
      end
    end

    # return IDictionary<ConceptCode, PayrollArticle[]>
    def self.collect_pendings_collection(collected_concepts)
      empty_collection = {}

      final_collection = collected_concepts.inject(empty_collection) do |agr, c, p|
        merge_collection = Hash.new([c, self.collect_all_pending_articles(agr, c, p, collected_concepts)])
        agr.merge(merge_collection) {|key, old_val, new_val| new_val}
      end
    end

    # return PayrollArticle[]
    def self.collect_all_pending_articles(collected_aggregates, concept_code, article, collected_concepts)
      collected_pendings = pending_articles.inject([]) do |agr, x|
        agr.concat(self.collect_all_pendings_deep(agr, x, collected_concepts))
      end
    end

    # return PayrollArticle[]
    def self.collect_all_pendings_deep(collected_aggregates, article, collected_concepts)
      pendings_articles = self.get_pendings_from_aggregates(collected_aggregates, article)
      return pendings_articles unless pendings_articles.nil?

      pendings_articles = self.get_pendings_from_concepts(article, collected_concepts)
    end

    def self.get_pendings_from_aggregates(collected_aggregates, article)
      collected_pendings = collected_aggregates.select {|x| x.code == article.code}
      return nil if collected_pendings.count == 0
      collected_pendings.dup
    end

    def self.collect_pendings_for_concept(collected_concepts, article)
      articles_pendings_key_value = collected_concepts.select {|key, _| key == article.concept_code}
      articles_pendings_array = articles_pendings_key_value.map {|val| val.last}
    end

    def self.get_pendings_from_concepts(article, collected_concepts)
      concepts_pendings = self.collect_pendings_for_concept(collected_concepts, article)

      pendings_articles = concepts_pendings.inject([article]) do |agr, x|
        arg.concat(self.collect_all_pendings_deep(agr, x, collected_concepts))
      end
    end

  end
end

