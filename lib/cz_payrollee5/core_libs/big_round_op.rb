module CzPayrollee5
  class BigRoundOp
    def self.multiply(op1, op2)
      big_op1 = BigDecimal.new(op1, 15)
      big_op2 = BigDecimal.new(op2, 15)
      return big_op1*big_op2
    end

    def self.divide(op1, op2)
      big_op1 = BigDecimal.new(op1, 15)
      big_op2 = BigDecimal.new(op2, 15)
      if (big_op2 == 0)
        return BigDecimal(0, 15)
      end
      return big_op1/big_op2
    end

    def self.multiply_and_divide(op1, op2, div)
      big_op1 = BigDecimal.new(op1, 15)
      big_op2 = BigDecimal.new(op2, 15)
      big_div = BigDecimal.new(div, 15)
      if (big_div == 0)
        return BigDecimal(0, 15)
      end
      return big_op1*big_op2/big_div
    end

    def self.round_up(value_dec)
      BigDecimal.new(value_dec < 0 ? -value_dec.abs.ceil : value_dec.abs.ceil)
    end

    def self.round_down(value_dec)
      BigDecimal.new(value_dec < 0 ? -value_dec.abs.floor : value_dec.abs.floor)
    end

    def self.near_round_up(value_dec, nearest=100)
      self.multiply(self.round_up(self.divide(value_dec, nearest)), nearest)
    end

    def self.near_round_down(value_dec, nearest=100)
      self.multiply(self.round_down(self.divide(value_dec, nearest)), nearest)
    end

    def self.decimal_cast(number)
      BigDecimal.new(number, 15)
    end
  end
end