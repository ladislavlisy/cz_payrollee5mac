module CzPayrollee5
  class SubjectsSavPensionArticle < PayrollArticle
   def initialize
     super(ArticleConstants::REF_SUBJECTS_SAV_PENSION, ConceptConstants::REF_SUBJECTS_SAV_PENSION)
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
