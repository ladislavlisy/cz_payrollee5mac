module CzPayrollee5
  class FactorsTupleBuilder
    def self.add_factor_by_symbol(init_facts, party, article_symbol, fact_values, config)
      new_code_order = TermComparator.get_new_order(init_facts.keys, party, article_symbol.code)

      pair_to_merge = FactorsPairBuilder.pair_by_symbol_providing_order(
          party, article_symbol, new_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = FactorsDictBuilder.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.ins_factor_by_symbol(init_facts, party, article_symbol, code_order, fact_values, config)
      pair_to_merge = FactorsPairBuilder.pair_by_symbol_providing_order(
          party, article_symbol, code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = FactorsDictBuilder.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.add_factor_by_code(init_facts, party, article_code, fact_values, config)
      new_code_order = TermComparator.get_new_order(init_facts.keys, party, article_code)

      pair_to_merge = FactorsPairBuilder.pair_by_code_providing_order(
          party, article_code, new_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = FactorsDictBuilder.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.ins_factor_by_code(init_facts, party, article_code, code_order, fact_values, config)
      pair_to_merge = FactorsPairBuilder.pair_by_code_providing_order(
          party, article_code, code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = FactorsDictBuilder.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end
  end
end

