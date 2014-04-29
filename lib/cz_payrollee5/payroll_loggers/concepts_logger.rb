require 'logger'

module CzPayrollee5
  class ConceptsLogger

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
    end

    def self.log_concept_info(concept_val)
      line_definition = "#{concept_val.description}\t#{concept_val.calc_category_text}\t"

      line_definition += self.log_pending_articles_info(concept_val.pending_articles)

      line_definition += self.log_summary_articles_info(concept_val.summary_articles)

      line_definition += self.log_spec_values_info(concept_val.spec_values)
    end

    def self.log_pending_articles_info(pending_articles)
      line_definition = ''

      pending_articles_count = pending_articles.count

      pending_articles.each do |article|
        line_definition += "#{article.description}\t"
      end

      pending_articles_count.upto(5) do
        line_definition += "\t"
      end
      line_definition
    end

    def self.log_summary_articles_info(summary_articles)
      line_definition = ''

      summary_articles_count = summary_articles.count

      summary_articles.each do |article|
        line_definition += "#{article.description}\t"
      end

      summary_articles_count.upto(1) do
        line_definition += "\t"
      end
      line_definition
    end

    def self.log_spec_values_info(spec_values)
      spec_values.join(', ')
    end

  end
end

