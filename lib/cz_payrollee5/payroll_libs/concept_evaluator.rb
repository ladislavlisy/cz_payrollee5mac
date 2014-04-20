module CzPayrollee5
  class ConceptEvaluator
    def self.evaluate(group, eval_specs, setup)
      pending_articles = ArticleCollector.collect_pending_articles(eval_specs)

      evalSteps = prepare_eval_steps(group, eval_specs, pending_articles, setup)

      eval_results = evaluate_concepts(setup, eval_steps)

      return eval_results
    end

    def self.prepare_eval_steps(group, init_steps, eval_articles, setup)
      empty_values = {}

      pending_steps = init_steps.dup

      eval_steps = eval_articles.Aggregate(pending_steps,
         (agr, article) => (EvalSpecDictFactory
         .ins_eval_spec_from_article_symbol(agr, group, article, empty_values, setup).Item2
         .ToDictionary(key => key.Key, value => value.Value)))

      return eval_steps
    end


    def self.evaluate_concepts(eval_steps, setup)
      empty_results = {}

      orderedEvalSteps = evalSteps.sort(x => (x.Value));

      results = ordered_eval_steps.Aggregate(empty_results,
         (agr, x) => (agr.Union(new Dictionary<TermOrder, PayrollResult>() {
         { x.Key, x.Value.evaluate(setup, agr) }
         }).ToDictionary(key => key.Key, value => value.Value)));

      return results;
    end
  end
end

