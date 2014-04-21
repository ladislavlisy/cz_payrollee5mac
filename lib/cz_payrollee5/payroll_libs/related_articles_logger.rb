require 'logger'

module CzPayrollee5
  class RelatedArticlesLogger

    def self.log_models(models, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO

      models.each do |concept_key, concept_val|
        line_definition = self.log_concept_info(concept_val)

        log.info("#{line_definition}")
      end
    end

    def self.log_concept_info(concept_val)
      line_definition = "#{concept_val.description} - #{concept_val.related_articles.count}\n"

      line_definition += self.log_related_articles_info(concept_val.related_articles)

    end

    def self.log_related_articles_info(related_articles)
      line_definition = ''

      related_articles_count = related_articles.count

      related_articles.each do |article|
        line_definition += "#{article.description} - #{article.concept_description}\n"
      end

      line_definition
    end
  end
end

