module CzPayrollee5
  class ValueExtractor
    def self.get_valid_or_zero_int(values, symbolic_key)
      value_for_key = values[symbolic_key]
      if is_fix_number(value_for_key)
        value_for_key
      else
        0
      end
    end

    def self.get_valid_or_zero_uint(values, symbolic_key)
      value_for_key = values[symbolic_key]
      if is_ufix_number(value_for_key)
        value_for_key
      else
        0
      end
    end

    def self.get_valid_or_zero_decimal(values, symbolic_key)
      value_for_key = values[symbolic_key]
      if is_fix_number(value_for_key)
        decimal_number(value_for_key)
      elsif is_dec_number(value_for_key)
        value_for_key
      else
        decimal_zero
      end
    end

    def self.get_valid_or_zero_date(values, symbolic_key, date_default)
      value_for_key = values[symbolic_key]
      if is_date_value(value_for_key)
        value_for_key
      else
        date_default
      end
    end

    def self.get_valid_or_zero_array_of_int(values, symbolic_key, array_length)
      value_for_key = values[symbolic_key]
      if is_array_of_int_with_length(value_for_key, array_length)
        value_for_key
      else
        Array.new(array_length) {0}
      end
    end

    def self.is_dec_number(value_for_key)
      value_for_key.kind_of?(BigDecimal)
    end

    def self.is_fix_number(value_for_key)
      value_for_key.kind_of?(Integer)
    end

    def self.is_ufix_number(value_for_key)
      value_for_key.kind_of?(Integer)
    end

    def self.is_date_value(value_for_key)
      value_for_key.kind_of?(Date)
    end

    def self.is_array_of_int_with_length(value_for_key, array_length)
      value_for_key.kind_of?(Array) && value_for_key.length==array_length && is_fix_number(value_for_key[0])
    end

    def self.decimal_zero
      BigRoundOp.decimal_cast(0)
    end

    def self.decimal_number(int_number)
      BigRoundOp.decimal_cast(int_number)
    end
  end
end