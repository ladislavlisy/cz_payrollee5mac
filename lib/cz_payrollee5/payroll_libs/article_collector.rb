module CzPayrollee5
  class ArticleCollector
    def self.collect_related_articles(source_concepts)
      source_concepts_copy = source_concepts.dup

      related_articles = source_concepts_copy.inject([]) do |agr, term_pair|
        term_key = term_pair.first
        term_con = term_pair.last
        term_pending = term_con.pending_articles
        agr.concat(self.collect_related_deep(term_key, term_pending))
      end
      related_unique = related_articles.uniq

      return related_unique
    end

    def self.collect_related_deep(term, concept)
      related_articles_copy = concept.related_articles

      if related_articles_copy.nil?
        return []
      else
        return related_articles_copy.dup
      end
    end

    # collect all related pendings articles
    #
    # ==== Attributes
    #
    # * +pending_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Returns
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    def self.collect_related_collection(pending_map)
      initial_map = {}

      related_map = pending_map.inject(initial_map) do |agr, concept_pair|
        collect_related_for_concept(agr, concept_pair, pending_map)
      end
    end

    # collect a new related pendings articles for one concept
    #
    # ==== Attributes
    #
    # * +related_agr+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +concept_pair+ - Array[concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +pending_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Returns
    #
    # * +related_ret+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    def self.collect_related_for_concept(related_agr, concept_pair, pending_map)
      code = concept_pair.first
      pend = concept_pair.last

      related_arry = self.collect_all_related_articles(related_agr, code, pend, pending_map)

      related_ret = merge_into_aggregates(related_agr, code, related_arry)
    end

    # merge a new related pendings articles into Hash
    #
    # ==== Attributes
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +concept_code+ - uint
    #
    # * +concept_related+ - Array:PayrollArticle
    #
    # ==== Returns
    #
    # * +related_ret+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    def self.merge_into_aggregates(related_map, concept_code, concept_related)
      merge_collection = Hash[concept_code, concept_related.uniq]

      related_ret = related_map.merge(merge_collection) { |key, _, new_val| new_val }
    end

    # collect all related pendings articles for one concept
    #
    # ==== Attributes
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +concept_code+ - uint
    #
    # * +concept_pend+ - Array:PayrollArticle
    #
    # ==== Returns
    #
    # * +concept_related+ - Array:PayrollArticle
    #
    def self.collect_all_related_articles(related_map, concept_code, concept_pend, pending_map)
      concept_related = concept_pend.inject([]) do |agr, article|
        agr.concat(self.collect_deep_related_articles(agr, article, pending_map))
      end
    end

    # collect all related pendings articles for one article from pending array
    #
    # ==== Attributes
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +article+ - PayrollArticle
    #
    # * +pending_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Returns
    #
    # * +article_related+ - Array:PayrollArticle
    #
    def self.collect_deep_related_articles(related_map, article, pending_map)
      article_related = self.find_result_in_related(related_map, article)
      return article_related unless article_related.nil?

      article_related = self.get_related_from_pending(related_map, article, pending_map)
    end

    def self.find_result_in_related(related_map, article)
      article_related = Array(related_map[article.concept_code])
      return nil if article_related.count == 0
      article_related.dup
    end

    # collect all related pendings articles for concept pending array
    #
    # ==== Attributes
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +article+ - PayrollArticle
    #
    # * +pending_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Returns
    #
    # * +article_related+ - Array:PayrollArticle
    #
    def self.get_related_from_pending(related_map, article, pending_map)
      article_pending = self.find_pending_for_article(pending_map, article)

      article_related = article_pending.inject([article]) do |agr, article_source|
        agr.concat(self.collect_deep_related_articles(related_map, article_source, pending_map))
      end
    end

    def self.find_pending_for_article(pending_map, article)
      article_pending = Array(pending_map[article.concept_code])
    end

  end
end

