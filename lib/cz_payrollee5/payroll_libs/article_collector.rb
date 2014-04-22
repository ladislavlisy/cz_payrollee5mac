module CzPayrollee5
  class ArticleCollector
    # collect all related pendings articles into collection
    # Hash [concept_code:uint, pendings:Array:PayrollArticle]
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

    # collect all related pendings articles for one concept
    #
    # ==== Attributes
    #
    # * +related_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +concept_pair+ - Array[concept_code:uint, pendings:Array:PayrollArticle]
    #
    # * +pending_map+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Returns
    #
    # * +related_ret+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    def self.collect_related_for_concept(related_map, concept_pair, pending_map)
      code = concept_pair.first
      pend = concept_pair.last

      related_arry = self.collect_all_related_articles(related_map, code, pend, pending_map)

      related_ret = merge_into_aggregates(related_map, code, related_arry)
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
        agr.concat(self.collect_deep_related_articles(related_map, article, pending_map))
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
      article_related = self.collect_from_related(related_map, article, pending_map)

      from_related = !article_related.nil?

      return article_related if from_related

      article_related = self.collect_from_pending(related_map, article, pending_map)
      return article_related
    end

    # collect related pendings articles for concept from related_map
    # if there is key in related_map, otherwise returns nil
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
    def self.collect_from_related(related_map, article, pending_map)
      not_from_related = !related_map.has_key?(article.concept_code)
      return nil if not_from_related

      article_related = self.find_related_for_article(related_map, article)

      article_to_arry = Array(article)
      return article_to_arry.concat(article_related)
    end

    # collect all related pendings articles for concept pending array
    # if there is not key in related_map, otherwise returns nil
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
    def self.collect_from_pending(related_map, article, pending_map)
      not_from_pending = related_map.has_key?(article.concept_code)
      return nil if not_from_pending

      article_pending = self.find_pending_for_article(pending_map, article)

      article_related = article_pending.inject([article]) do |agr, article_source|
        agr.concat(self.collect_deep_related_articles(related_map, article_source, pending_map))
      end
    end

    def self.find_related_for_article(related_map, article)
      article_related = Array(related_map[article.concept_code])
    end

    def self.find_pending_for_article(pending_map, article)
      article_pending = Array(pending_map[article.concept_code])
    end

  end
end

