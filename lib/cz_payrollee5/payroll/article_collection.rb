module CzPayrollee5
  class ArticleCollection
    attr_reader :models

    def initialize
      load_payroll_articles
      @models = Hash.new
      @models[ArticleCode::ARTICLE_UNKNOWN] = UnknownArticle.new
    end

    def article_from_models(article_symbol)
      if !models.include?(article_symbol.code)
        base_article = empty_article_for(article_symbol)
        models[article_symbol.code] = base_article
      else
        base_article = models[article_symbol.code]
      end
      base_article
    end

    def find_article(article_code)
      if models.include?(article_code)
        base_article = models[article_code]
      else
        base_article = models[ArticleCode::ARTICLE_UNKNOWN]
      end
      base_article
    end

    def empty_article_for(article_symbol)
      empty_article = ArticleFactory.article_for(article_symbol.name)
      empty_article
    end

    def load_payroll_articles
      lib_dir = File.dirname(__FILE__)
      full_pattern = File.join(lib_dir, '../payroll_articles', '*.rb')
      Dir.glob(full_pattern).each {|article_file| require article_file}
    end
  end
end