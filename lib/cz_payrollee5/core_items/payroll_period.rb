module CzPayrollee5
  class PayrollPeriod
    attr_reader :code, :name

    @@PRESENT = 0

    def initialize(year, month, name)
      @code = (year * 100) + month
      @name = name
    end

    def year
      code/100
    end

    def month
      code%100
    end

    def year_int
      (code / 100)
	end

    def month_int
      (code % 100)
    end
    
	def month_order
	  year_order = [0, (year_int - 2000)].max
	  (year_order*12 + month_int)
	end

    def description
      calendar_day = Date.new(year, month, 1)
      calendar_day.to_formatted_s(:month_name_and_year)
    end
  end
end