module CzPayrollee5
  class TermOrderComparer
    def self.equals(pair_x, pair_y)
      return pair_x.first <=> pair_y.first
    end
  end
end
