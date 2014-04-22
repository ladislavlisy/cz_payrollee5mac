require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TermOrder < TermParty
    include Comparable

    attr_reader :code, :code_order
    cattr_reader :UNKNOWN_CODE, :UNKNOWN_ORDER

    @@UNKNOWN_CODE = 0
    @@UNKNOWN_ORDER = 0

    def initialize(party, code, code_order)
      super(party.contract_order, party.position_order, party.period_base)
      @code = code
      @code_order = code_order
    end

    def self.get_empty
      TermOrder.new(TermParty.get_empty, self.UNKNOWN_CODE, self.UNKNOWN_ORDER)
    end

    def ==(other)
      super.==(other) && @code == other.code && @code_order == other.code_order
    end

    def <=>(other)
      if super.==(other)
        if @code == other.code
          @code_order <=> other.code_order
        else
          @code <=> other.code
        end
      else
        super.<=>(other)
      end
    end

    def eql?(other)
      super.==(other) && @code == other.code && @code_order == other.code_order
    end

    def hash
      group_int = super.hash
      code_int = @code.hash
      code_order_int = @code_order.hash
      group_int ^ code_int ^ code_order_int
    end
  end
end