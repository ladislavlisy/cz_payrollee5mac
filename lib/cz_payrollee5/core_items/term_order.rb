module CzPayrollee5
  class TermOrder < TermGroup
    include Comparable

    attr_reader :code, :code_order

    def initialize(group, code, code_order)
      super(group.contract_order, group.position_order)
      @code = code
      @code_order = code_order
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