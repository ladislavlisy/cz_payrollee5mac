module CzPayrollee5
  class PayrollCalculation
    attr_reader :period, :factors, :last_token
    attr_reader :config, :results, :last_party

    # add convert function from string, date
    # add convert function from uint, TypeContract

    def self.create_payroll(period, config)
      factors = Hash.new
      results = Hash.new
      last_party = TermParty.get_empty
      last_token = TermOrder.get_empty

      PayrollCalculation.new(period, config, factors, results, last_party, last_token)
    end

    def initialize(period, config, factors, results, last_party, last_token)
      @period = period
      @config = config
      @factors = factors
      @results = results
      @last_party = last_party
      @last_token = last_token
    end

    def evaluate
      contract_party = TermPartiesCollector.collect_parties_for_contract(@factors)

      position_party = TermPartiesCollector.collect_parties_for_position(@factors)

      process_map = ProcessDictBuilder.create_calculation_steps(@factors,
                                                                contract_party, position_party,
                                                                @config)

      log_payroll_calculus(process_map)

      init_results = Hash.new

      next_results = ResultsDictBuilder.evaluate_concept_to_results(process_map, init_results, @config)

      log_payroll_results(next_results)

      PayrollCalculation.new(@period, @config, @factors, next_results, @last_party, @last_token)
    end

    # ADD contract PayrollConcept into factors - EmploymentTermArticle
    #
    # ==== Attributes
    #
    # *+type+ - Type of Contract (Employment)
    #
    # *+date_start+ - date of start of employment
    #
    # *+date_end+ - date of end of employment
    #
    # ==== Returns
    #
    # *+PayrollCalculation.new
    #
    def add_contract_party(type, date_start, date_end)
      factor_symbol = ArticleConstants.REF_EMPLOYMENT_TERM

      factor_values = {
          start_date: date_start,
          end_date: date_end,
          contract_type: type
      }
      add_new_contract_fact(factor_symbol, factor_values)
    end

    def add_position_party(date_start, date_end)
      factor_symbol = ArticleConstants.REF_POSITION_TERM

      factor_values = {
          start_date: date_start,
          end_date: date_end
      }

      add_new_position_fact(factor_symbol, factor_values)
    end

    def add_schedule_into_position(type_schedule, hours_weekly)
      factor_symbol = ArticleConstants.REF_SCHEDULE_WORK

      factor_values = {
          schedule_type: type_schedule,
          hours_weekly: hours_weekly
      }

      add_fact_into_position(factor_symbol, factor_values)
    end

    def add_salary_into_position(amount_salary)
      factor_symbol = ArticleConstants.REF_SALARY_BASE

      factor_values = {
          amount_monthly: amount_salary
      }
      add_fact_into_position(factor_symbol, factor_values)
    end

    def add_absence_into_position(hours_monthly)
      factor_symbol = ArticleConstants.REF_HOURS_ABSENCE

      factor_values = {
          hours_monthly: hours_monthly
      }
      add_fact_into_position(factor_symbol, factor_values)
    end

    def add_tax_declaration(liability_code, residency_code, statement_code)
      factor_symbol = ArticleConstants.REF_TAX_INCOME

      factor_values = {
          liability_code: Values.to_uint(liability_code)
      }
      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_participation_insurance_health(liability_code, minimum_amount)
      factor_symbol = ArticleConstants.REF_INSURANCE_HEALTH_BASE

      factor_values = {
          liability_code: Values.to_uint(liability_code),
          minimum_amount: Values.to_uint(minimum_amount)
      }
      add_fact_into_contract(factor_symbol, factor_values)
    end

    def add_participation_insurance_social(liability_code)
      factor_symbol = ArticleConstants.REF_INSURANCE_SOCIAL_BASE

      factor_values = {
          liability_code: Values.to_uint(liability_code)
      }
      add_fact_into_contract(factor_symbol, factor_values)
    end

    def add_participation_savings_pension(liability_code)
      factor_symbol = ArticleConstants.REF_SAVINGS_PENSION_BASE

      factor_values = {
          liability_code: Values.to_uint(liability_code)
      }
      add_fact_into_contract(factor_symbol, factor_values)
    end

    def add_tax_claim_payer(relief_code)
      factor_symbol = ArticleConstants.REF_TAX_CLAIM_PAYER

      factor_values = {
          relief_code: Values.to_uint(relief_code)
      }
      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_tax_claim_child(relief_code, disablement)
      factor_symbol = ArticleConstants.REF_TAX_CLAIM_CHILD

      factor_values = {
          relief_code: Values.to_uint(relief_code),
          disablement: Values.to_uint(disablement)
      }
      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_tax_claim_disability(relief_level_1_code, relief_level_2_code, relief_level_3_code)
      factor_symbol = ArticleConstants.REF_TAX_CLAIM_DISABILITY

      factor_values = {
          relief_level_1_code: Values.to_uint(relief_level_1_code),
          relief_level_2_code: Values.to_uint(relief_level_2_code),
          relief_level_3_code: Values.to_uint(relief_level_3_code)

      }
      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_tax_claim_studying(relief_code)
      factor_symbol = ArticleConstants.REF_TAX_CLAIM_STUDYING

      factor_values = {
          relief_code: Values.to_uint(relief_code)
      }
      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_employer_insurance_health(liability_code)
      factor_symbol = ArticleConstants.REF_TAX_ADVANCE_HEALTH

      factor_values = {
          liability_code: Values.to_uint(liability_code)
      }
      add_fact_into_contract(factor_symbol, factor_values)
    end

    def add_employer_insurance_social(liability_code)
      factor_symbol = ArticleConstants.REF_TAX_ADVANCE_SOCIAL

      factor_values = {
          liability_code: Values.to_uint(liability_code)
      }
      add_fact_into_contract(factor_symbol, factor_values)
    end

    def add_income_gross
      factor_symbol = ArticleConstants.REF_INCOME_GROSS

      factor_values = { }

      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_income_netto
      factor_symbol = ArticleConstants.REF_INCOME_NETTO

      factor_values = { }

      add_fact_into_payroll(factor_symbol, factor_values)
    end

    def add_new_contract_fact(article, values)
      add_party = @last_party.get_no_contract_party

      ret_tuple = FactorsTupleBuilder.add_factor_by_symbol(@factors,
                                                           add_party, article, values, @config)
      next_facts = ret_tuple.last
      next_token = ret_tuple.first

      next_party = next_token.get_new_contract_party(next_token.code_order)

      PayrollCalculation.new(@period, @config, next_facts, @results, next_party, next_token)
    end

    def add_new_position_fact(article, values)
      add_party = @last_party.get_no_position_party

      ret_tuple = FactorsTupleBuilder.add_factor_by_symbol(@factors,
                                                           add_party, article, values, @config)
      next_facts = ret_tuple.last
      next_token = ret_tuple.first

      next_party = next_token.get_new_position_party(next_token.code_order)

      PayrollCalculation.new(@period, @config, next_facts, @results, next_party, next_token)
    end

    def add_fact_into_contract(article, values)
      add_party = @last_party.get_contract_party

      ret_tuple = FactorsTupleBuilder.add_factor_by_symbol(@factors,
                                                           add_party, article, values, @config)
      next_facts = ret_tuple.last
      next_token = ret_tuple.first

      next_party = next_token.get_party

      PayrollCalculation.new(@period, @config, next_facts, @results, next_party, next_token)
    end

    def add_fact_into_position(article, values)
      add_party = @last_party.get_position_party

      ret_tuple = FactorsTupleBuilder.add_factor_by_symbol(@factors,
                                                           add_party, article, values, @config)
      next_facts = ret_tuple.last
      next_token = ret_tuple.first

      next_party = next_token.get_party

      PayrollCalculation.new(@period, @config, next_facts, @results, next_party, next_token)
    end

    def add_fact_into_payroll(article, values)
      add_party = @last_party.get_no_contract_party

      ret_tuple = FactorsTupleBuilder.add_factor_by_symbol(@factors,
                                                           add_party, article, values, @config)
      next_facts = ret_tuple.last
      next_token = ret_tuple.first

      next_party = next_token.get_party

      PayrollCalculation.new(@period, @config, next_facts, @results, next_party, next_token)
    end

    def log_factors
      log_payroll_factors(@factors)
    end

    def log_results
      log_payroll_results(@results)
    end

    def log_payroll_calculus(factors)
      FactorsLogger.log_collection(factors, 'calculus_log')
    end

    def log_payroll_factors(factors)
      FactorsLogger.log_collection(factors, 'factors_log')
    end

    def log_payroll_results(results)
      ResultsLogger.log_collection(results, 'results_log')
    end
  end
end
