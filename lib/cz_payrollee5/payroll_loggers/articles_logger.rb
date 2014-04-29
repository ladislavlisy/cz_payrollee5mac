require 'logger'

module CzPayrollee5
  class ArticlesLogger
    def self.log_concepts_collection(collection, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n" % [msg]
      }

      line_definition = ''

      collection.each do |concept_key, articles|
        line_definition += self.log_concept_code_articles_info(concept_key, articles)
      end

      log.info("#{line_definition}")

      log.info('--- end ---')
    end

    def self.log_concept_articles(concept, articles, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      log.info('--- begin ---')

      line_definition = self.log_concept_articles_info(concept, articles)

      log.info("#{line_definition}")

      log.info('--- end ---')
    end

    def self.log_concept_code_articles(concept_code, articles, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      log.info('--- begin ---')

      line_definition = self.log_concept_articles_info(concept_code, articles)

      log.info("#{line_definition}")

      log.info('--- end ---')
    end

    def self.log_concept_articles_info(concept, articles)
      line_definition = log_concept_info(concept)

      line_definition += '--- ARTICLES ---\n'

      line_definition += log_articles_array(articles)

      line_definition += '--- ARTICLES ---\n\n'
    end

    def self.log_concept_code_articles_info(concept_code, articles)
      line_definition = log_concept_code_info(concept_code)

      line_definition += '--- ARTICLES ---\n'

      line_definition += log_articles_array(articles)

      line_definition += '--- ARTICLES ---\n\n'
    end

    def self.log_pending_articles(article, articles, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      log.info('--- begin ---')

      line_definition = "--- PENDING ---\n"

      line_definition += self.log_article_info(article)

      line_definition += self.log_articles_array(articles)

      log.info("#{line_definition}")

      log.info('--- end ---')
    end

    def self.log_related_articles(article, articles, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      log.info('--- begin ---')

      line_definition = "--- RELATED ---\n"

      line_definition += self.log_article_info(article)

      line_definition += self.log_articles_array(articles)

      log.info("#{line_definition}")

      log.info('--- end ---')
    end

    def self.log_articles_array(articles)
      if articles.nil?
        line_definition = "empty\n"
        return line_definition
      else
        line_definition = "count - #{articles.count}\n"
      end
      articles.each do |article|
        line_definition += log_article_info(article);
      end
      return line_definition
    end

    def self.log_article_info(article)
      line_definition = "#{article.description} - #{article.concept_name}\n"
    end

    def self.log_concept_info(concept)
      line_definition = "#{concept.description} - #{concept.article_code}\n"
    end

    def self.log_concept_code_info(concept_code)
      line_definition = "#{ConceptCode.to_s(concept_code)} - CONCEPT\n"
    end

  end
end
