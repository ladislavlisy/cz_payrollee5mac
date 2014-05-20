class RoundOp
  def self.big_insurance_round_up(value_dec)
    BigRoundOp.round_up(value_dec)
  end

  def self.fix_insurance_round_up(value_dec)
    FixRoundOp.round_up(value_dec)
  end

  def self.big_tax_round_up(value_dec)
    BigRoundOp.round_up(value_dec)
  end

  def self.big_tax_round_down(value_dec)
    BigRoundOp.round_down(value_dec)
  end

  def self.fix_tax_round_up(value_dec)
    FixRoundOp.round_up(value_dec)
  end

  def self.fix_tax_round_down(value_dec)
    FixRoundOp.round_down(value_dec)
  end
end