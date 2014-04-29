require 'logger'

module CzPayrollee5
  class RelatedLogger < ArticlesLogger

    def self.log_models(models, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      models.each do |concept_key, concept_val|
        line_definition = self.log_concept_info(concept_val)

        log.info("#{line_definition}")
      end
      log.info('--- end ---')
    end

    def self.log_concept_info(concept_val)
      line_definition = "#{concept_val.description} - #{concept_val.related_articles.count}\n"

      line_definition += self.log_related_articles_info(concept_val)
    end

    def self.log_related_articles_info(concept)

      articles = concept.related_articles

      line_definition = log_articles_array(articles)

      line_definition
    end
  end
end

