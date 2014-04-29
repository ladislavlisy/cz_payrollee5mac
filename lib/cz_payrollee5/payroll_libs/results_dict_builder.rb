module CzPayrollee5
  class ResultsDictBuilder
    def self.evaluate_concept_to_results(process_map, init_results, config)
      results_map = process_map.inject(init_results) do |agr, concept_pair|
        self.evaluate_concept_and_merge(agr, concept_pair.first, concept_pair.last, config)
      end
      return results_map
    end

    def self.evaluate_concept_and_merge(results_map, eval_token, concept, config)
      evaluated_map = concept.evaluate(config, eval_token, results_map)

      return self.merge_to_results_map(results_map, evaluated_map)
    end

    def self.merge_to_results_map(results_map, evaluated_map)
      result_enum = results_map.merge(evaluated_map) do |merge_token, merge_concept, _|
        merge_concept
      end
      result_enum
    end
  end
end
