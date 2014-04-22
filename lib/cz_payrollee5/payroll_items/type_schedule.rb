require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TypeSchedule
    cattr_reader :UNIFORM_WEEK

    @@UNIFORM_WEEK  = 1

    def self.to_s(number_value)
      case number_value
        when TypeContract.UNIFORM_WEEK
          :UNIFORM_WEEK.id2name
        else
          'unknown'
      end
    end
  end
end

