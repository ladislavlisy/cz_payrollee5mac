module CzPayrollee5
  class ConceptComparer
    def self.concept_compare(concept_x, concept_y)
      if related_articles_for_code?(concept_x.related_articles, concept_y.article_code)
        return 1
      elsif related_articles_for_code?(concept_y.related_articles, concept_x.article_code)
        return -1
      elsif summary_articles_for_code?(concept_x.summary_articles, concept_y.article_code)
        return -1
      elsif summary_articles_for_code?(concept_y.summary_articles, concept_x.article_code)
        return 1
      elsif concept_x.calc_category == concept_y.calc_category
        concept_x.article_code <=> concept_y.article_code
      else
        concept_x.calc_category <=> concept_y.calc_category
      end
    end

    def self.count_related_articles(articles, code)
      articles.count {|x| x.code==code}
    end

    def self.count_summary_articles(articles, code)
      articles.count {|x| x.code==code}
    end

    def self.related_articles_for_code?(articles, code)
      count_related_articles(articles, code) != 0
    end

    def self.summary_articles_for_code?(articles, code)
      count_summary_articles(articles, code) != 0
    end
  end
end
