module CzPayrollee5
  class IncomeGrossArticle < PayrollArticle
   def initialize
     super(ArticleConstants.REF_INCOME_GROSS, ConceptConstants.REF_INCOME_GROSS)
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
