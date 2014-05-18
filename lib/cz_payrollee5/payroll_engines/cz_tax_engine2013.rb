module CzPayrollee5
  class CzTaxEngine2013 < CzTaxEnginePrototype
    BENEFIT_PAYER_2012 = 2070

    BENEFIT_DISABILITY_1_2011 = 210
    BENEFIT_DISABILITY_2_2011 = 420
    BENEFIT_DISABILITY_3_2011 = 1345

    BENEFIT_STUDYING_2011 = 335
    BENEFIT_CHILD_2012 = 1117

    RATE_ADVANCE_2011 = 15.0
    RATE_SOLIDARY_2013 = 7.0

    BRACKET_SMALLER_2011 = 100
    BRACKET_WITHHOLD_2011 = 5000
    BRACKET_SOLIDARY_2013 = (4*25884)

    SMALLER_ROUND_UP_2011 = true
    ZERO_SOLIDARY_TAX_2013 = false

    def initialize
      validity_from = PayrollPeriod.new(2013, 1, 'January 2013')
      validity_end = PayrollPeriod.new(2013, 12, 'December 2013')

      super(validity_from, validity_end)
    end

    # amount for payer tax benefit
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_payer
      BENEFIT_PAYER_2012
    end

    # amount for payer tax benefit
    #
    # ==== Attributes
    #
    # *+disablement+ - level of disablement (1,2,3)
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_disability(disablement)
      case disablement
        when 1
          BENEFIT_DISABILITY_1_2011
        when 2
          BENEFIT_DISABILITY_2_2011
        when 3
          BENEFIT_DISABILITY_3_2011
        else
          0
      end
    end

    # amount for studying tax benefit
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_studying
      BENEFIT_STUDYING_2011
    end

    # amount for child tax benefit
    #
    # ==== Attributes
    #
    # *+disablement+ - level of disablement (0,1)
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_child(disablement)
      case disablement
        when 0
          BENEFIT_CHILD_2012
        else
          BENEFIT_CHILD_2012*2
      end
    end

    # is smaller tax income rounded up
    # from year 2011
    #
    # ==== Returns
    #
    # *+bool+ smaller tax income rounded up == true
    #
    def smaller_income_rounded_up?
      SMALLER_ROUND_UP_2011
    end

    # rate for advance tax
    #
    # ==== Returns
    #
    # *+decimal+ percentage
    #
    def tax_advance_rate_level_one
      factor = RATE_ADVANCE_2011
      BigDecimal.new(factor.fdiv(100), 15)
    end

    # is there zero solidary tax result
    #
    # ==== Returns
    #
    # *+bool+ solidary tax result is zero == true
    #
    def zero_solidary_tax?
      true
    end

    # rate for solidary tax
    #
    # ==== Returns
    #
    # *+decimal+ percentage
    #
    def tax_solidary_rate
      factor = RATE_SOLIDARY_2013
      BigDecimal.new(factor.fdiv(100), 15)
    end

    # max limit for applying smaller tax
    # for tax base <= 100 Kč
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_smaller_bracket_max
      BRACKET_SMALLER_2011
    end

    # start limit for applying withhold tax
    # for no tax statement and tax base <= 2000,3000,5000,10000
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_withhold_bracket_max
      BRACKET_WITHHOLD_2011
    end

    # start limit for applying solidary tax
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_solidary_bracket_max
      BRACKET_SOLIDARY_2013
    end
  end
end

