require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TypeContract
    cattr_reader :EMPLOYMENT

    @@EMPLOYMENT  = 1

    def self.to_s(category)
      case category
        when TypeContract.EMPLOYMENT
          :EMPLOYMENT.id2name
        else
          'unknown'
      end
    end
  end
end

