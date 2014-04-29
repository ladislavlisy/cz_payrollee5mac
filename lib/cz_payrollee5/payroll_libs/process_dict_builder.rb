module CzPayrollee5
  class ProcessDictBuilder
    def self.create_calculation_steps(factors, contract_party, position_party, config)
      related_dict = RelatedAggregator.collect_articles_to_evaluate(factors)

      process_init = factors.dup

      process_calc = related_dict.inject(process_init) do |agr, article|
        merge_to_process_map(agr, contract_party, position_party, article, config)
      end
      process_dict = Hash[process_calc.sort {|a,b| a.last<=>b.last}]

      return process_dict
    end

    def self.merge_to_process_map(factors_map, contract_party, position_party, article, config)
      empty_values = Hash.new

      fact_results = FactorsDictBuilder.validate_factor_by_symbol(factors_map, contract_party, position_party,
                                                                  article, empty_values, config)
      return fact_results
    end
  end
end
