module CzPayrollee5
  class TaxWithholdArticle < PayrollArticle
   def initialize
     super(ArticleConstants.REF_TAX_WITHHOLD, ConceptConstants.REF_TAX_WITHHOLD)
   end

   def insurance_health?
     super.insurance_health?
   end

   def insurance_social?
     super.insurance_social?
   end

   def tax_income?
     super.tax_income?
   end

   def income_gross?
     super.income_gross?
   end

   def income_netto?
     super.income_netto?
   end

   def deduction_netto?
     super.deduction_netto?
   end
  end
end
