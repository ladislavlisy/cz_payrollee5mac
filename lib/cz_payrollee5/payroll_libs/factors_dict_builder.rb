module CzPayrollee5
  class FactorsDictBuilder
    def self.validate_factor_by_symbol(init_facts, contract_party, position_party, article, fact_values, config)
      concept = config.article_concept_from_models(article)

      parties = concept.get_factor_parties(contract_party, position_party)

      eval_facts = parties.inject(init_facts) do |agr, party|
        self.complete_factor_by_symbol(init_facts, party, article, fact_values, config)
      end

      return eval_facts
    end

    def self.complete_factor_by_symbol(init_facts, party, article_symbol, fact_values, config)
      ins_code_order = TermComparator.get_order(init_facts.keys, party, article_symbol.code)

      pair_to_merge = FactorsPairBuilder.pair_by_symbol_providing_order(
          party, article_symbol, ins_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = self.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)
      return eval_facts
    end

    def self.merge_to_factors(init_facts, token_to_merge, concept_to_merge)
      eval_merge = { token_to_merge => concept_to_merge }
      eval_facts = init_facts.merge(eval_merge) do |merge_token, merge_concept, _|
        merge_concept
      end
      eval_facts
    end
  end
end

