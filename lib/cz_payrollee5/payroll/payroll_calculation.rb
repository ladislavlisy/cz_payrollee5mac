module CzPayrollee5
  class PayrollCalculation
    attr_reader :period, :factors, :last_token
    attr_reader :config, :results, :last_party

    def initialize(period, config, factors, results, last_party, last_token)
      @period = period
      @config = config
      @factors = factors
      @results = results
      @last_party = last_party
      @last_token = last_token
    end

    def self.create_payroll(period, config)
      factors = Hash.new
      results = Hash.new
      last_party = TermParty.get_empty
      last_token = TermOrder.get_empty

      PayrollCalculation.new(period, config, factors, results, last_party, last_token)
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
      init_factors = @factors
      init_results = @results
      last_party = @last_party
      last_token = @last_token

      factor_symbol = ArticleConstants.REF_EMPLOYMENT_TERM
      # add convert function from string, date
      # add convert function from uint, TypeContract
      factor_values = {
          start_date: date_start,
          end_date: date_end,
          contract_type: type
      }
      party_current = last_party.get_no_contract_party

      next_returns = EvalFactDictFactory.
          add_factor_by_symbol(init_factors,
                               party_current,
                               factor_symbol,
                               factor_values,
                               config)

      next_factors = next_returns.last

      next_token = next_returns.first

      next_party = next_token.get_new_contract_party(next_token.code_order)

      PayrollCalculation.new(@period, @config, next_factors, init_results, next_party, next_token)
    end

    def add_position_party(date_start, date_end)
      init_factors = @factors
      init_results = @results
      last_party = @last_party
      last_token = @last_token

      factor_symbol = ArticleConstants.REF_POSITION_TERM
      # add convert function from string, date
      # add convert function from uint, TypeContract
      factor_values = {
          start_date: date_start,
          end_date: date_end
      }
      party_current = last_party.get_no_position_party

      next_returns = EvalFactDictFactory.
          add_factor_by_symbol(init_factors,
                               party_current,
                               factor_symbol,
                               factor_values,
                               config)

      next_factors = next_returns.last

      next_token = next_returns.first

      next_party = next_token.get_new_position_party(next_token.code_order)

      PayrollCalculation.new(@period, @config, next_factors, init_results, next_party, next_token)
    end

    def add_schedule_into_position(type_schedule, hours_weekly)
      init_factors = @factors
      init_results = @results
      last_party = @last_party
      last_token = @last_token

      factor_symbol = ArticleConstants.REF_SCHEDULE_WORK
      # add convert function from string, date
      # add convert function from uint, TypeContract
      factor_values = {
          schedule_type: type_schedule,
          hours_weekly: hours_weekly
      }
      party_current = last_party.get_position_party

      next_returns = EvalFactDictFactory.
          add_factor_by_symbol(init_factors,
                               party_current,
                               factor_symbol,
                               factor_values,
                               config)

      next_factors = next_returns.last

      next_token = next_returns.first

      next_party = next_token.get_position_party

      PayrollCalculation.new(@period, @config, next_factors, init_results, next_party, next_token)
    end

    def add_salary_into_position(amount_salary)
      init_factors = @factors
      init_results = @results
      last_party = @last_party
      last_token = @last_token

      factor_symbol = ArticleConstants.REF_SALARY_BASE
      # add convert function from string, date
      # add convert function from uint, TypeContract
      factor_values = {
          amount_monthly: amount_salary
      }
      party_current = last_party.get_position_party

      next_returns = EvalFactDictFactory.
          add_factor_by_symbol(init_factors,
                               party_current,
                               factor_symbol,
                               factor_values,
                               config)

      next_factors = next_returns.last

      next_token = next_returns.first

      next_party = next_token.get_position_party

      PayrollCalculation.new(@period, @config, next_factors, init_results, next_party, next_token)
    end
  end
end