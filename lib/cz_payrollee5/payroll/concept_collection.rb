require 'logger'

module CzPayrollee5
  class ConceptCollection
    attr_reader :models

    def initialize
      load_payroll_concepts
      @models = Hash.new
      @models[ConceptCode.CONCEPT_UNKNOWN] = UnknownConcept.new
    end

    def article_concept_from_models(article)
      concept_from_models(article.concept, article.code)
    end

    def concept_from_models(concept_symbol, article_code)
      if models.include?(concept_symbol.code)
        base_concept = models[concept_symbol.code]
      else
        base_concept = create_concept_for(concept_symbol, article_code)
        models[concept_symbol.code] = base_concept
      end
      base_concept
    end

    def find_concept(concept_code)
      if models.include?(concept_code)
        base_concept = models[concept_code]
      else
        base_concept = models[ConceptConstants.CONCEPT_UNKNOWN]
      end
      base_concept
    end

    def create_concept_for(concept_symbol, article_code)
      empty_values = {}
      empty_concept = ConceptFactory.concept_for(article_code, concept_symbol.name, empty_values)
      return empty_concept
    end

    def collect_concepts_with_pendings
      concepts_with_pendings = models.map do |code, concept|
        [code, concept.pending_articles]
      end
      Hash.new(concepts_with_pendings.select {|x| x.last.count != 0})
    end

    def init_pending_articles
      concepts_with_pendings = collect_concepts_with_pendings

      pendings_art_collected = ArticleCollector.collect_pendings_collection(concepts_with_pendings)

      models.each do |concept_key, concept_val|
        concept_pendings_key_value = pendings_art_collected.select {|key, val| key == concept_key}

        concept_pendings_array = concept_pendings_key_value.map {|val| val.last}

        concept_pendings_count = concept_pendings_array.count

        if concept_pendings_count != 0
          article_pendings = concept_pendings_array.first

          concept_val.set_pending_articles(article_pendings)
        else
          concept_val.set_pending_articles([])
        end
      end

      log_concepts_info

    end

    def log_concepts_info
      log = Logger.new('concept_definitions.txt')
      log.level = Logger::INFO

      models.each do |concept_key, concept_val|
        line_definition = log_concept_info(concept_val)

        log.info("#{line_definition}")
      end
    end

    def log_concept_info(concept_val)
      line_definition = "#{concept_val.description}\t#{concept_val.calc_category_text}\t"

      line_definition += log_pending_articles_info(concept_val.pending_articles)

      line_definition += log_summary_articles_info(concept_val.summary_articles)

      line_definition += log_spec_values_info(concept_val.spec_values)
    end

    def log_spec_values_info(spec_values)
      spec_values.join(', ')
    end

    def log_pending_articles_info(pending_articles)
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

    def log_summary_articles_info(summary_articles)
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

    def load_payroll_concepts
      lib_dir = File.dirname(__FILE__)
      full_pattern = File.join(lib_dir, '../payroll_concepts', '*.rb')
      Dir.glob(full_pattern).each {|concept_file| require concept_file}
    end
  end
end