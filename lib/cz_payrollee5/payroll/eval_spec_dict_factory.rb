module CzPayrollee5
  class EvalSpecDictFactory
    def self.add_contract_term(init_steps, setup)
      eval_group = TermGroup.new(TermGroup.UNKNOWN_CONTRACT, TermGroup.UNKNOWN_POSITION, PayrollPeriod.PRESENT)

      contract_values = {}

      return self.add_eval_spec_from_article_code(init_steps, eval_group, ArticleConstants.REF_EMPLOYMENT_TERM.code, contract_values, setup)
    end

    def self.add_position_term(init_steps, setup)
      eval_group = TermGroup.new(TermGroup.UNKNOWN_CONTRACT, TermGroup.UNKNOWN_POSITION, PayrollPeriod.PRESENT)

      position_values = {}

      return self.add_eval_spec_from_article_code(init_steps, eval_group, ArticleConstants.REF_POSITION_TERM.code, position_values, setup)
    end

    def self.add_eval_spec_from_article_symbol(init_steps, group, article_symbol, eval_spec_values, setup)
      new_code_order = TermComparator.get_new_order(init_steps.Keys, group, article_symbol.code)

      step_to_merge = EvalSpecPairFactory.spec_pair_from_article_symbol_providing_order(
          group, article_symbol, new_code_order, eval_spec_values, setup)

      eval_point = step_to_merge.first

      eval_steps = self.merge_step_to_eval_steps(init_steps, step_to_merge.first, step_to_merge.last)

      return [eval_point, eval_steps]
    end

    def self.ins_eval_spec_from_article_symbol(init_steps, group, article_symbol, eval_spec_values, setup)
      ins_code_order = TermComparator.get_order(init_steps.keys, group, article_symbol.code)

      step_to_merge = EvalSpecPairFactory.spec_pair_from_article_symbol_providing_order(
          group, article_symbol, ins_code_order, eval_spec_values, setup)

      eval_point = self.merge_step_to_eval_steps(init_steps, step_to_merge.first, step_to_merge.last)

      eval_steps = step_to_merge.first

      return [eval_point, eval_steps]
    end

    def self.add_eval_spec_from_article_code(init_steps, group, article_code, eval_spec_values, setup)
      new_code_order = TermComparator.get_new_order(init_steps.keys, group, article_code)

      step_to_merge = EvalSpecPairFactory.spec_pair_from_article_code_providing_order(
          group, article_code, new_code_order, eval_spec_values, setup)

      eval_point = step_to_merge.first

      eval_steps = self.merge_step_to_eval_steps(init_steps, step_to_merge.first, step_to_merge.last)

      return [eval_point, eval_steps]
    end

    def self.ins_eval_spec_from_article_code(init_steps, group, article_code, eval_spec_values, setup)
      ins_code_order = TermComparator.get_order(init_steps.keys, group, article_code)

      step_to_merge = EvalSpecPairFactory.spec_pair_from_article_code_providing_order(
          group, article_code, ins_code_order, eval_spec_values, setup)

      eval_point = self.merge_step_to_eval_steps(init_steps, step_to_merge.first, step_to_merge.last)

      eval_steps = step_to_merge.first

      return [eval_point, eval_steps]
    end

    def self.merge_step_to_eval_steps(init_steps, termkey_to_merge, concept_to_merge)
      eval_merge = { termkey_to_merge => concept_to_merge }
      eval_steps = init_steps.merge(eval_merge) do |merge_termkey, merge_concept, _|
        merge_concept
      end
      eval_steps
    end
  end
end

