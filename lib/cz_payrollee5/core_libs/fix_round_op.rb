module CzPayrollee5
  class FixRoundOp
    def self.round_up(value_dec)
      (value_dec < 0 ? -value_dec.abs.ceil : value_dec.abs.ceil)
    end

    def self.round_down(value_dec)
      (value_dec < 0 ? -value_dec.abs.floor : value_dec.abs.floor)
    end

  end
end
