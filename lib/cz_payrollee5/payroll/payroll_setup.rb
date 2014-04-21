module CzPayrollee5
  class PayrollSetup
    attr_reader :articles_collection, :concepts_collection

    def self.create
      instance = PayrollSetup.new
      instance.init_articles_and_concepts
      return instance
    end

    def initialize
      @articles_collection = ArticleCollection.new
      @concepts_collection = ConceptCollection.new
    end

    def article_from_models(article_symbol)
      articles_collection.article_from_models(article_symbol)
    end

    def find_article(article_code)
      articles_collection.find_article(article_code)
    end

    def article_concept_from_models(article)
      concepts_collection.article_concept_from_models(article)
    end

    def concept_from_models(concept_symbol, article_code)
      concepts_collection.concept_from_models(concept_symbol, article_code)
    end

    def find_concept(concept_code)
      concepts_collection.find_concept(concept_code)
    end

    def load_article(article_symbol)
      articles_collection.article_from_models(article_symbol)
    end

    def load_concept(concept_symbol)
      concepts_collection.concept_from_models(concept_symbol, ArticleCode.ARTICLE_UNKNOWN)
    end

    def init_articles
      load_article(ArticleConstants.REF_EMPLOYMENT_TERM)
      load_article(ArticleConstants.REF_EMPLOYMENT_TERM)
      load_article(ArticleConstants.REF_AGREEMENT_WORK_TERM)
      load_article(ArticleConstants.REF_AGREEMENT_TASK_TERM)
      load_article(ArticleConstants.REF_POSITION_TERM)
      load_article(ArticleConstants.REF_SCHEDULE_WORK)
      load_article(ArticleConstants.REF_SALARY_BASE)
      load_article(ArticleConstants.REF_TIMESHEET_SCHEDULE)
      load_article(ArticleConstants.REF_TIMESHEET_WORKING)
      load_article(ArticleConstants.REF_TIMESHEET_ABSENCE)
      load_article(ArticleConstants.REF_HOURS_WORKING)
      load_article(ArticleConstants.REF_HOURS_ABSENCE)
      load_article(ArticleConstants.REF_INSURANCE_HEALTH_BASE)
      load_article(ArticleConstants.REF_INSURANCE_HEALTH)
      load_article(ArticleConstants.REF_INSURANCE_SOCIAL_BASE)
      load_article(ArticleConstants.REF_INSURANCE_SOCIAL)
      load_article(ArticleConstants.REF_SAVING_PENSION_BASE)
      load_article(ArticleConstants.REF_SAVING_PENSION)
      load_article(ArticleConstants.REF_TAX_INCOME)
      load_article(ArticleConstants.REF_TAX_INCOME_ADVANCE)
      load_article(ArticleConstants.REF_TAX_INCOME_WITHHOLD)
      load_article(ArticleConstants.REF_TAX_CLAIM_PAYER)
      load_article(ArticleConstants.REF_TAX_CLAIM_CHILD)
      load_article(ArticleConstants.REF_TAX_CLAIM_DISABILITY)
      load_article(ArticleConstants.REF_TAX_CLAIM_STUDYING)
      load_article(ArticleConstants.REF_TAX_RELIEF_PAYER)
      load_article(ArticleConstants.REF_TAX_RELIEF_CHILD)
      load_article(ArticleConstants.REF_TAX_BONUS_CHILD)
      load_article(ArticleConstants.REF_TAX_ADVANCE_HEALTH)
      load_article(ArticleConstants.REF_TAX_ADVANCE_SOCIAL)
      load_article(ArticleConstants.REF_TAX_ADVANCE_PART)
      load_article(ArticleConstants.REF_TAX_ADVANCE_BASE)
      load_article(ArticleConstants.REF_TAX_SOLIDARY_BASE)
      load_article(ArticleConstants.REF_TAX_ADVANCE)
      load_article(ArticleConstants.REF_TAX_SOLIDARY)
      load_article(ArticleConstants.REF_TAX_ADVANCE_FINAL)
      load_article(ArticleConstants.REF_TAX_WITHHOLD_HEALTH)
      load_article(ArticleConstants.REF_TAX_WITHHOLD_SOCIAL)
      load_article(ArticleConstants.REF_TAX_WITHHOLD_PART)
      load_article(ArticleConstants.REF_TAX_WITHHOLD_BASE)
      load_article(ArticleConstants.REF_TAX_WITHHOLD)
      load_article(ArticleConstants.REF_INCOME_GROSS)
      load_article(ArticleConstants.REF_INCOME_NETTO)
    end

    def init_concepts
      load_concept(ConceptConstants.REF_EMPLOYMENT_TERM)
      load_concept(ConceptConstants.REF_AGREEMENT_WORK_TERM)
      load_concept(ConceptConstants.REF_AGREEMENT_TASK_TERM)
      load_concept(ConceptConstants.REF_POSITION_TERM)
      load_concept(ConceptConstants.REF_SCHEDULE_WEEKLY)
      load_concept(ConceptConstants.REF_SALARY_MONTHLY)
      load_concept(ConceptConstants.REF_TIMESHEET_SCHEDULE)
      load_concept(ConceptConstants.REF_TIMESHEET_WORKING)
      load_concept(ConceptConstants.REF_TIMESHEET_ABSENCE)
      load_concept(ConceptConstants.REF_HOURS_WORKING)
      load_concept(ConceptConstants.REF_HOURS_ABSENCE)
      load_concept(ConceptConstants.REF_INSURANCE_HEALTH_BASE)
      load_concept(ConceptConstants.REF_INSURANCE_HEALTH)
      load_concept(ConceptConstants.REF_INSURANCE_SOCIAL_BASE)
      load_concept(ConceptConstants.REF_INSURANCE_SOCIAL)
      load_concept(ConceptConstants.REF_SAVING_PENSION_BASE)
      load_concept(ConceptConstants.REF_SAVING_PENSION)
      load_concept(ConceptConstants.REF_TAX_INCOME)
      load_concept(ConceptConstants.REF_TAX_INCOME_ADVANCE)
      load_concept(ConceptConstants.REF_TAX_INCOME_WITHHOLD)
      load_concept(ConceptConstants.REF_TAX_CLAIM_PAYER)
      load_concept(ConceptConstants.REF_TAX_CLAIM_CHILD)
      load_concept(ConceptConstants.REF_TAX_CLAIM_DISABILITY)
      load_concept(ConceptConstants.REF_TAX_CLAIM_STUDYING)
      load_concept(ConceptConstants.REF_TAX_RELIEF_PAYER)
      load_concept(ConceptConstants.REF_TAX_RELIEF_CHILD)
      load_concept(ConceptConstants.REF_TAX_BONUS_CHILD)
      load_concept(ConceptConstants.REF_TAX_ADVANCE_HEALTH)
      load_concept(ConceptConstants.REF_TAX_ADVANCE_SOCIAL)
      load_concept(ConceptConstants.REF_TAX_ADVANCE_PART)
      load_concept(ConceptConstants.REF_TAX_ADVANCE_BASE)
      load_concept(ConceptConstants.REF_TAX_SOLIDARY_BASE)
      load_concept(ConceptConstants.REF_TAX_ADVANCE)
      load_concept(ConceptConstants.REF_TAX_SOLIDARY)
      load_concept(ConceptConstants.REF_TAX_ADVANCE_FINAL)
      load_concept(ConceptConstants.REF_TAX_WITHHOLD_HEALTH)
      load_concept(ConceptConstants.REF_TAX_WITHHOLD_SOCIAL)
      load_concept(ConceptConstants.REF_TAX_WITHHOLD_PART)
      load_concept(ConceptConstants.REF_TAX_WITHHOLD_BASE)
      load_concept(ConceptConstants.REF_TAX_WITHHOLD)
      load_concept(ConceptConstants.REF_INCOME_GROSS)
      load_concept(ConceptConstants.REF_INCOME_NETTO)
    end

    def init_articles_and_concepts
      init_articles
      init_concepts

      concepts_collection.init_related_articles
    end
  end
end
