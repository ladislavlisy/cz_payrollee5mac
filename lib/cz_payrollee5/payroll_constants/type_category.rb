require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class TypeCategory
    CALC_CATEGORY_TERMS  = 0
    CALC_CATEGORY_START  = 1
    CALC_CATEGORY_TIMES  = 2
    CALC_CATEGORY_AMOUNT = 3
    CALC_CATEGORY_GROSS  = 4
    CALC_CATEGORY_NETTO  = 5
    CALC_CATEGORY_FINAL  = 9

    def self.to_s(category)
      case category
      when TypeCategory::CALC_CATEGORY_TERMS
        :CALC_CATEGORY_TERMS.id2name
      when TypeCategory::CALC_CATEGORY_START
        :CALC_CATEGORY_START.id2name
      when TypeCategory::CALC_CATEGORY_TIMES
        :CALC_CATEGORY_TIMES.id2name
      when TypeCategory::CALC_CATEGORY_AMOUNT
        :CALC_CATEGORY_AMOUNT.id2name
      when TypeCategory::CALC_CATEGORY_GROSS
        :CALC_CATEGORY_GROSS.id2name
      when TypeCategory::CALC_CATEGORY_NETTO
        :CALC_CATEGORY_NETTO.id2name
      when TypeCategory::CALC_CATEGORY_FINAL
        :CALC_CATEGORY_FINAL.id2name
      else
        'unknown'
      end
    end
  end
end