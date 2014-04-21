require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TermParty
    include Comparable

    attr_reader :contract_order, :position_order, :period_base
    cattr_reader :UNKNOWN_CONTRACT, :UNKNOWN_POSITION, :CURRENT_B_PERIOD

    @@UNKNOWN_CONTRACT = 0
    @@UNKNOWN_POSITION = 0
    @@CURRENT_B_PERIOD = 0

    def self.get_empty
      TermParty.new(self.UNKNOWN_CONTRACT, self.UNKNOWN_POSITION, self.CURRENT_B_PERIOD)
    end

    def initialize(contract_order, position_order, period_base)
      @contract_order = contract_order
      @position_order = position_order
      @period_base = period_base
    end

    def get_no_contract
      TermParty.new(self.UNKNOWN_CONTRACT, self.UNKNOWN_POSITION, period_base)
    end

    def get_no_position
      TermParty.new(contract_order, self.UNKNOWN_POSITION, period_base)
    end

    def ==(other)
      @contract_order == other.contract_order && @position_order == other.position_order && @period_base == other.period_base
    end

    def <=>(other)
      if @contract_order == other.contract_order
        if @position_order == other.position_order
          @period_base <=> other.period_base
        else
          @position_order <=> other.position_order
        end
      else
        @contract_order <=> other.code
      end
    end

    def eql?(other)
      @contract_order == other.contract_order && @position_order == other.position_order && @period_base == other.period_base
    end

    def hash
      contract_order_int = @contract_order.hash
      position_order_int = @position_order.hash
      period_base_int = @period_base.hash
      contract_order_int ^ position_order_int ^ period_base_int
    end
  end
end
