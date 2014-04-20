module CzPayrollee5
  class ArticleCollector
    def self.collect_pending_articles(source_concepts)
      source_concepts_copy = source_concepts.dup

      pending_articles = source_concepts_copy.inject([]) do |agr, term_pair|
        term_key = term_pair.first
        term_con = term_pair.last
        term_pending = term_con.pending_articles
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

      final_collection = collected_concepts.inject(empty_collection) do |agr, concept_pair|
        concept_code = concept_pair.first
        concept_pend = concept_pair.last
        collected_pendings = self.collect_all_pending_articles(agr,
            concept_code, concept_pend, collected_concepts)
        merge_to_aggregates(agr, concept_code, collected_pendings)
      end
    end

    def self.merge_to_aggregates(aggregates_concepts, concept_code, collected_pendings)
      merge_collection = Hash[concept_code, collected_pendings.uniq]
      aggregates_concepts.merge(merge_collection) { |key, old_val, new_val| new_val }
    end

    # return PayrollArticle[]
    def self.collect_all_pending_articles(collected_aggregates, concept_code, pending_articles, collected_concepts)
      collected_pendings = pending_articles.inject([]) do |agr, article|
        agr.concat(self.collect_all_pendings_deep(agr, article, collected_concepts))
      end
    end

    # return PayrollArticle[]
    def self.collect_all_pendings_deep(collected_aggregates, article, collected_concepts)
      pendings_articles = self.get_pendings_from_aggregates(collected_aggregates, article)
      return pendings_articles unless pendings_articles.nil?

      pendings_articles = self.get_pendings_from_concepts(article, collected_concepts)
    end

    def self.get_pendings_from_aggregates(collected_aggregates, article)
      pendings_articles_array = Array(collected_aggregates[article.concept_code])
      return nil if pendings_articles_array.count == 0
      pendings_articles_array.dup
    end

    def self.collect_pendings_for_concept(collected_concepts, article)
      pendings_articles_array = Array(collected_concepts[article.concept_code])
    end

    def self.get_pendings_from_concepts(article, collected_concepts)
      pendings_articles_source = self.collect_pendings_for_concept(collected_concepts, article)

      collected_pendings_articles = pendings_articles_source.inject([article]) do |agr, article_source|
        agr.concat(self.collect_all_pendings_deep(agr, article_source, collected_concepts))
      end
    end

  end
end

