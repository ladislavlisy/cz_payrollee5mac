module CzPayrollee5
  class PayrollActEngine
    attr_reader :valid_from, :valid_end

    # initialize
    #
    # ==== Attributes
    #
    # *+valid_from+ - start of validity (PayrollPeriod)
    #
    # *+valid_end+ - end of validity (PayrollPeriod)
    #
    def initialize(valid_from, valid_end)
      @valid_from = valid_from
      @valid_end = valid_end
    end

    # test period for validity
    #
    # ==== Attributes
    #
    # *+period+ - period for test (PayrollPeriod)
    #
    # ==== Returns
    #
    # *+bool+ valid == true
    #
    def period_valid?(period)
      @valid_from <= period && period <= @valid_end
    end
  end
end

