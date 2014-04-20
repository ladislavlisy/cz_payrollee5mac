require 'active_support/core_ext/string/inflections'

module CzPayrollee5
  class ConceptFactory
    def self.concept_for(article_code, concept_name, article_values)
      class_name = self.classname_for(concept_name)
      concept_class = self.class.const_get(class_name)
      concept_class.new(article_code, article_values)
    end

    def self.classname_for(concept_name)
      match_result_name = concept_name.match(/CONCEPT_(.*)/)[1]
      class_name = match_result_name.underscore.camelize + 'Concept'
      class_name
    end
  end
end