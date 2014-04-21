module CzPayrollee5
  class EvalFactDictFactory
    def self.add_factor_by_symbol(init_facts, party, article_symbol, fact_values, config)
      new_code_order = TermComparator.get_new_order(init_facts.keys, party, article_symbol.code)

      pair_to_merge = EvalFactPairFactory.pair_by_symbol_providing_order(
          party, article_symbol, new_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = self.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.ins_factor_by_symbol(init_facts, party, article_symbol, fact_values, config)
      ins_code_order = TermComparator.get_order(init_facts.keys, party, article_symbol.code)

      pair_to_merge = EvalFactPairFactory.pair_by_symbol_providing_order(
          party, article_symbol, ins_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = self.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.add_factor_by_code(init_facts, party, article_code, fact_values, config)
      new_code_order = TermComparator.get_new_order(init_facts.keys, party, article_code)

      pair_to_merge = EvalFactPairFactory.pair_by_code_providing_order(
          party, article_code, new_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = self.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
    end

    def self.ins_factor_by_code(init_facts, party, article_code, fact_values, config)
      ins_code_order = TermComparator.get_order(init_facts.keys, party, article_code)

      pair_to_merge = EvalFactPairFactory.pair_by_code_providing_order(
          party, article_code, ins_code_order, fact_values, config)

      eval_point = pair_to_merge.first

      eval_facts = self.merge_to_factors(init_facts, pair_to_merge.first, pair_to_merge.last)

      return [eval_point, eval_facts]
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

