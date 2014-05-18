module CzPayrollee5
  class CzTaxEnginePrototype < PayrollActEngine
    def initialize(valid_from, valid_end)
      super(valid_from, valid_end)
    end

    # amount for payer tax benefit
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_payer
      0
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
      0
    end

    # amount for studying tax benefit
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_benefit_studying
      0
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
      0
    end

    # is smaller tax income rounded up
    # from year 2011
    #
    # ==== Returns
    #
    # *+bool+ smaller tax income rounded up == true
    #
    def smaller_income_rounded_up?
      true
    end

    # rate for advance tax
    #
    # ==== Returns
    #
    # *+decimal+ percentage
    #
    def tax_advance_rate_level_one
      BigDecimal.new(0, 15)
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
      BigDecimal.new(0, 15)
    end

    # max limit for applying smaller tax
    # for tax base <= 100 Kč
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_smaller_bracket_max
      100
    end

    # start limit for applying withhold tax
    # for no tax statement and tax base <= 2000,3000,5000,10000
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_withhold_bracket_max
      0
    end

    # start limit for applying solidary tax
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_solidary_bracket_max
      0
    end

    # adjusted base for applying solidary tax
    #
    # ==== Attributes
    #
    # *+tax_income+ - tax income
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_solidary_base(tax_income)
      max_sol_base = tax_solidary_bracket_max
      eff_sol_base = [0,tax_income-max_sol_base].max
    end

    # rounded base for applying standard tax
    #
    # ==== Attributes
    #
    # *+is_tax_statement+ - signed tax statement
    #
    # *+taxable_health+ - taxable partial base health
    #
    # *+taxable_social+ - taxable partial base social
    #
    # *+taxable_income+ - taxable income
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_base_partial_rounded(is_tax_statement, taxable_health, taxable_social, taxable_income)
      taxable_super = taxable_income+taxable_health+taxable_social

      tax_base_rounded(is_tax_statement, taxable_income, taxable_super)
    end

    # rounded base for applying standard tax
    #
    # ==== Attributes
    #
    # *+is_tax_statement+ - signed tax statement
    #
    # *+taxable_income+ - taxable partial income
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_base_rounded(is_tax_statement, taxable_income, taxable_super)
      apply_advance_tax = is_tax_statement || advance_tax_base?(taxable_income)

      if apply_advance_tax
        round_advance_base(is_tax_statement, taxable_super, smaller_income_rounded_up?)
      else
        0
      end
    end

    # rounded base for applying standard tax
    #
    # ==== Attributes
    #
    # *+tax_statement+ - signed tax statement
    #
    # *+tax_income+ - tax super income
    #
    # *+smaller_round_up+ - round up from 2011
    #
    # ==== Returns
    #
    # *+decimal+ amount v Kč
    #
    def round_advance_base(tax_statement, tax_income, smaller_round_up)
      amount_for_calc = [0, tax_income].max

      if smaller_tax_base?(amount_for_calc)
        if smaller_round_up
          RoundOp.big_tax_round_up(amount_for_calc)
        else
          RoundOp.big_tax_round_down(amount_for_calc)
        end
      else
        BigRoundOp.near_round_up(amount_for_calc, 100)
      end
    end

    # result of calculation of standard tax
    #
    # ==== Attributes
    #
    # *+income+ - tax income
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_advance_part_result(tax_income, tax_base)
      return 0 if zero_tax?(tax_base)

      tax_standard = 0
      if smaller_tax_base?(tax_base)
        tax_standard = tax_advance_small_result(tax_base)
      else
        tax_standard = tax_advance_standard_result(tax_base)
      end
    end

    # result of calculation of solidary tax
    #
    # ==== Attributes
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_solidary_part_result(tax_income, tax_base)
      return 0 if zero_solidary_tax?

      return 0 if zero_tax?(tax_base)

      eff_sol_base = tax_solidary_base(tax_income)

      tax_solidary = fix_tax_round_up(
          BigRoundOp.multiply(eff_sol_base, tax_solidary_rate))
    end

    # result of calculation of standard tax
    #
    # ==== Attributes
    #
    # *+income+ - tax income
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_advance_result(tax_income, tax_base)
      return 0 if zero_tax?(tax_base)

      tax_standard = tax_advance_part_result(tax_income, tax_base)
      tax_solidary = tax_solidary_part_result(tax_income, tax_base)

      tax_standard + tax_solidary
    end

    # result of calculation of standard tax
    # for not small tax base (>100 Kč)
    #
    # ==== Attributes
    #
    # *+income+ - tax income
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_advance_standard_result(tax_base)
      return 0 if zero_tax?(tax_base)

      tax_standard = RoundOp.fix_tax_round_up(
          BigRoundOp.multiply(tax_base, tax_advance_rate_level_one))
    end

    # result of calculation of standard tax
    # for small tax base (<=100 Kč)
    #
    # ==== Attributes
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+number+ amount v Kč
    #
    def tax_advance_small_result(tax_base)
      return 0 if zero_tax?(tax_base)

      tax_standard = RoundOp.fix_tax_round_up(
          BigRoundOp.multiply(tax_base, tax_advance_rate_level_one))
    end

    # is there zero tax result for tax base
    #
    # ==== Attributes
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+bool+ tax result is zero == true
    #
    def zero_tax?(tax_base)
      (tax_base <= 0)
    end

    # is tax base rounded by small currency for tax base
    #
    # ==== Attributes
    #
    # *+base+ - tax base
    #
    # ==== Returns
    #
    # *+bool+ tax base is rounded by small currency == true
    #
    def smaller_tax_base?(tax_base)
      (tax_base <= tax_smaller_bracket_max)
    end

    # is applicable withhold tax result
    #
    # ==== Returns
    #
    # *+bool+ withhold tax result is applicable == true
    #
    def withhold_tax_base?(tax_base)
      (tax_base <= tax_withhold_bracket_max)
    end

    # is applicable advance tax result
    #
    # ==== Returns
    #
    # *+bool+ advance tax result is applicable == true
    #
    def advance_tax_base?(tax_base)
      (tax_base > tax_withhold_bracket_max)
    end
  end
end

