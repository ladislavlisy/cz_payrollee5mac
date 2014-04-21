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

    # Map models: Hash of concepts to Hash of pendings
    #
    # - from [code:uint, concept:PayrollConcept]
    #
    # - to Hash [code:uint, pendings:Array:PayrollArticle]
    #
    # ==== Attributes
    #
    # * +models+ - Hash [concept_code:uint, concept:PayrollConcept]
    #
    # ==== Returns
    #
    # * +pendings+ - Hash [concept_code:uint, pendings:Array:PayrollArticle]
    #
    def models_to_pendings
      concepts_with_pendings = models.map do |code, concept|
        [code, concept.pending_articles]
      end
      Hash[concepts_with_pendings.select {|x| x.last.count != 0}]
    end

    def init_pending_articles
      pending_map = models_to_pendings

      related_map = ArticleCollector.collect_related_collection(pending_map)

      models.each do |concept_key, concept_val|
        related_array = Array(related_map[concept_key])

        related_count = related_array.count

        if related_count != 0
          article_related = related_array

          concept_val.set_related_articles(article_related)
        else
          concept_val.set_related_articles([])
        end
      end

      RelatedArticlesLogger.log_models(models, 'concept_related')

      ConceptsLogger.log_models(models, 'concept_definitions')

    end

    def load_payroll_concepts
      lib_dir = File.dirname(__FILE__)
      full_pattern = File.join(lib_dir, '../payroll_concepts', '*.rb')
      Dir.glob(full_pattern).each {|concept_file| require concept_file}
    end
  end
end