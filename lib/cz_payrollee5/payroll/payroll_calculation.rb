module CzPayrollee5
  class PayrollCalculation
    attr_reader :period, :setup, :specs, :results
    attr_reader :last_term, :last_group

    def initialize(period, setup, specs, results, last_group, last_term)
      @period = period
      @setup = setup
      @specs = specs
      @results = results
      @last_group = last_group
      @last_term = last_term
    end

    def self.create_payroll(period, setup)
      specs = Hash.new
      results = Hash.new
      last_group = TermGroup.new(0, 0, 0)
      last_term = TermOrder.new(TermGroup.new(0, 0, 0), 0, 0)

      PayrollCalculation.new(period, setup, specs, result, last_group, last_term)
    end

    def add_contract_group
      specs = @specs
      results = @results
      last_group = @last_group
      last_term = @last_term

      PayrollCalculation.new(@period, @setup, specs, results, last_group, last_term)
    end

    def add_position_group

    end

    def add_within_contract_group

    end

    def add_within_position_group

    end

    def add_without_group

    end

  end
end