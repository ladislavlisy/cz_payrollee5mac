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

    def <=>(concept_other)
      if related_articles_for_code?(related_articles, concept_other.article_code)
        return 1
      elsif related_articles_for_code?(concept_other.related_articles, article_code)
        return -1
      elsif summary_articles_for_code?(summary_articles, concept_other.article_code)
        return -1
      elsif summary_articles_for_code?(concept_other.summary_articles, article_code)
        return 1
      elsif calc_category == concept_other.calc_category
        article_code <=> concept_other.article_code
      else
        calc_category <=> concept_other.calc_category
      end
    end

    def count_related_articles(articles, code)
      articles.count {|x| x.code=code}
    end

    def count_summary_articles(articles, code)
      articles.count {|x| x.code=code}
    end

    def related_articles_for_code?(articles, code)
      count_related_articles(articles, code) != 0
    end

    def summary_articles_for_code?(articles, code)
      count_summary_articles(articles, code) != 0
    end
  end
end

