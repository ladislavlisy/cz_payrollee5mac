require 'active_support/core_ext/string/inflections'

module CzPayrollee5
  class ArticleFactory
    def self.article_for(article_name)
      class_name = self.classname_for(article_name)
      article_class = self.class.const_get(class_name)
      article_class.new
    end

    def self.classname_for(article_name)
      match_result_name = article_name.match(/ARTICLE_(.*)/)[1]
      class_name = match_result_name.underscore.camelize + 'Article'
      class_name
    end
  end
end