require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TypeContract
    EMPLOYMENT  = 1

    def self.to_s(number_value)
      case number_value
        when TypeContract::EMPLOYMENT
          :EMPLOYMENT.id2name
        else
          'unknown'
      end
    end
  end
end

