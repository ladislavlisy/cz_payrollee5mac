require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class ArticleConstants
    cattr_reader :REF_UNKNOWN
    cattr_reader :REF_EMPLOYMENT_TERM
    cattr_reader :REF_AGREEMENT_WORK_TERM
    cattr_reader :REF_AGREEMENT_TASK_TERM
    cattr_reader :REF_POSITION_TERM
    cattr_reader :REF_SCHEDULE_WORK
    cattr_reader :REF_SALARY_BASE
    cattr_reader :REF_TIMESHEET_SCHEDULE
    cattr_reader :REF_TIMESHEET_WORKING
    cattr_reader :REF_TIMESHEET_ABSENCE
    cattr_reader :REF_HOURS_WORKING
    cattr_reader :REF_HOURS_ABSENCE
    cattr_reader :REF_INSURANCE_HEALTH_BASE
    cattr_reader :REF_INSURANCE_HEALTH
    cattr_reader :REF_INSURANCE_SOCIAL_BASE
    cattr_reader :REF_INSURANCE_SOCIAL
    cattr_reader :REF_SAVINGS_PENSION_BASE
    cattr_reader :REF_SAVINGS_PENSION
    cattr_reader :REF_TAX_INCOME
    cattr_reader :REF_TAX_INCOME_ADVANCE
    cattr_reader :REF_TAX_INCOME_WITHHOLD
    cattr_reader :REF_TAX_CLAIM_PAYER
    cattr_reader :REF_TAX_CLAIM_CHILD
    cattr_reader :REF_TAX_CLAIM_DISABILITY
    cattr_reader :REF_TAX_CLAIM_STUDYING
    cattr_reader :REF_TAX_RELIEF_PAYER
    cattr_reader :REF_TAX_RELIEF_CHILD
    cattr_reader :REF_TAX_BONUS_CHILD
    cattr_reader :REF_TAX_ADVANCE_HEALTH
    cattr_reader :REF_TAX_ADVANCE_SOCIAL
    cattr_reader :REF_TAX_ADVANCE_PART
    cattr_reader :REF_TAX_ADVANCE_BASE
    cattr_reader :REF_TAX_SOLIDARY_BASE
    cattr_reader :REF_TAX_ADVANCE
    cattr_reader :REF_TAX_SOLIDARY
    cattr_reader :REF_TAX_ADVANCE_FINAL
    cattr_reader :REF_TAX_WITHHOLD_HEALTH
    cattr_reader :REF_TAX_WITHHOLD_SOCIAL
    cattr_reader :REF_TAX_WITHHOLD_PART
    cattr_reader :REF_TAX_WITHHOLD_BASE
    cattr_reader :REF_TAX_WITHHOLD
    cattr_reader :REF_INCOME_GROSS
    cattr_reader :REF_INCOME_NETTO

    @@REF_UNKNOWN                = Symbolic.new(ArticleCode.ARTICLE_UNKNOWN              , :ARTICLE_UNKNOWN.id2name)
    @@REF_EMPLOYMENT_TERM        = Symbolic.new(ArticleCode.ARTICLE_EMPLOYMENT_TERM      , :ARTICLE_EMPLOYMENT_TERM.id2name)
    @@REF_AGREEMENT_WORK_TERM    = Symbolic.new(ArticleCode.ARTICLE_AGREEMENT_WORK_TERM  , :ARTICLE_AGREEMENT_WORK_TERM.id2name)
    @@REF_AGREEMENT_TASK_TERM    = Symbolic.new(ArticleCode.ARTICLE_AGREEMENT_TASK_TERM  , :ARTICLE_AGREEMENT_TASK_TERM.id2name)
    @@REF_POSITION_TERM          = Symbolic.new(ArticleCode.ARTICLE_POSITION_TERM        , :ARTICLE_POSITION_TERM.id2name)
    @@REF_SCHEDULE_WORK          = Symbolic.new(ArticleCode.ARTICLE_SCHEDULE_WORK        , :ARTICLE_SCHEDULE_WORK.id2name)
    @@REF_SALARY_BASE            = Symbolic.new(ArticleCode.ARTICLE_SALARY_BASE          , :ARTICLE_SALARY_BASE.id2name)
    @@REF_TIMESHEET_SCHEDULE     = Symbolic.new(ArticleCode.ARTICLE_TIMESHEET_SCHEDULE   , :ARTICLE_TIMESHEET_SCHEDULE.id2name)
    @@REF_TIMESHEET_WORKING      = Symbolic.new(ArticleCode.ARTICLE_TIMESHEET_WORKING    , :ARTICLE_TIMESHEET_WORKING.id2name)
    @@REF_TIMESHEET_ABSENCE      = Symbolic.new(ArticleCode.ARTICLE_TIMESHEET_ABSENCE    , :ARTICLE_TIMESHEET_ABSENCE.id2name)
    @@REF_HOURS_WORKING          = Symbolic.new(ArticleCode.ARTICLE_HOURS_WORKING        , :ARTICLE_HOURS_WORKING.id2name)
    @@REF_HOURS_ABSENCE          = Symbolic.new(ArticleCode.ARTICLE_HOURS_ABSENCE        , :ARTICLE_HOURS_ABSENCE.id2name)
    @@REF_INSURANCE_HEALTH_BASE  = Symbolic.new(ArticleCode.ARTICLE_INSURANCE_HEALTH_BASE, :ARTICLE_INSURANCE_HEALTH_BASE.id2name)
    @@REF_INSURANCE_HEALTH       = Symbolic.new(ArticleCode.ARTICLE_INSURANCE_HEALTH     , :ARTICLE_INSURANCE_HEALTH.id2name)
    @@REF_INSURANCE_SOCIAL_BASE  = Symbolic.new(ArticleCode.ARTICLE_INSURANCE_SOCIAL_BASE, :ARTICLE_INSURANCE_SOCIAL_BASE.id2name)
    @@REF_INSURANCE_SOCIAL       = Symbolic.new(ArticleCode.ARTICLE_INSURANCE_SOCIAL     , :ARTICLE_INSURANCE_SOCIAL.id2name)
    @@REF_SAVINGS_PENSION_BASE   = Symbolic.new(ArticleCode.ARTICLE_SAVINGS_PENSION_BASE , :ARTICLE_SAVINGS_PENSION_BASE.id2name)
    @@REF_SAVINGS_PENSION        = Symbolic.new(ArticleCode.ARTICLE_SAVINGS_PENSION      , :ARTICLE_SAVINGS_PENSION.id2name)
    @@REF_TAX_INCOME             = Symbolic.new(ArticleCode.ARTICLE_TAX_INCOME           , :ARTICLE_TAX_INCOME.id2name)
    @@REF_TAX_INCOME_ADVANCE     = Symbolic.new(ArticleCode.ARTICLE_TAX_INCOME_ADVANCE   , :ARTICLE_TAX_INCOME_ADVANCE.id2name)
    @@REF_TAX_INCOME_WITHHOLD    = Symbolic.new(ArticleCode.ARTICLE_TAX_INCOME_WITHHOLD  , :ARTICLE_TAX_INCOME_WITHHOLD.id2name)
    @@REF_TAX_CLAIM_PAYER        = Symbolic.new(ArticleCode.ARTICLE_TAX_CLAIM_PAYER      , :ARTICLE_TAX_CLAIM_PAYER.id2name)
    @@REF_TAX_CLAIM_CHILD        = Symbolic.new(ArticleCode.ARTICLE_TAX_CLAIM_CHILD      , :ARTICLE_TAX_CLAIM_CHILD.id2name)
    @@REF_TAX_CLAIM_DISABILITY   = Symbolic.new(ArticleCode.ARTICLE_TAX_CLAIM_DISABILITY , :ARTICLE_TAX_CLAIM_DISABILITY.id2name)
    @@REF_TAX_CLAIM_STUDYING     = Symbolic.new(ArticleCode.ARTICLE_TAX_CLAIM_STUDYING   , :ARTICLE_TAX_CLAIM_STUDYING.id2name)
    @@REF_TAX_RELIEF_PAYER       = Symbolic.new(ArticleCode.ARTICLE_TAX_RELIEF_PAYER     , :ARTICLE_TAX_RELIEF_PAYER.id2name)
    @@REF_TAX_RELIEF_CHILD       = Symbolic.new(ArticleCode.ARTICLE_TAX_RELIEF_CHILD     , :ARTICLE_TAX_RELIEF_CHILD.id2name)
    @@REF_TAX_BONUS_CHILD        = Symbolic.new(ArticleCode.ARTICLE_TAX_BONUS_CHILD      , :ARTICLE_TAX_BONUS_CHILD.id2name)
    @@REF_TAX_ADVANCE_HEALTH     = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE_HEALTH   , :ARTICLE_TAX_ADVANCE_HEALTH.id2name)
    @@REF_TAX_ADVANCE_SOCIAL     = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE_SOCIAL   , :ARTICLE_TAX_ADVANCE_SOCIAL.id2name)
    @@REF_TAX_ADVANCE_PART       = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE_PART     , :ARTICLE_TAX_ADVANCE_PART.id2name)
    @@REF_TAX_ADVANCE_BASE       = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE_BASE     , :ARTICLE_TAX_ADVANCE_BASE.id2name)
    @@REF_TAX_SOLIDARY_BASE      = Symbolic.new(ArticleCode.ARTICLE_TAX_SOLIDARY_BASE    , :ARTICLE_TAX_SOLIDARY_BASE.id2name)
    @@REF_TAX_ADVANCE            = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE          , :ARTICLE_TAX_ADVANCE.id2name)
    @@REF_TAX_SOLIDARY           = Symbolic.new(ArticleCode.ARTICLE_TAX_SOLIDARY         , :ARTICLE_TAX_SOLIDARY.id2name)
    @@REF_TAX_ADVANCE_FINAL      = Symbolic.new(ArticleCode.ARTICLE_TAX_ADVANCE_FINAL    , :ARTICLE_TAX_ADVANCE_FINAL.id2name)
    @@REF_TAX_WITHHOLD_HEALTH    = Symbolic.new(ArticleCode.ARTICLE_TAX_WITHHOLD_HEALTH  , :ARTICLE_TAX_WITHHOLD_HEALTH.id2name)
    @@REF_TAX_WITHHOLD_SOCIAL    = Symbolic.new(ArticleCode.ARTICLE_TAX_WITHHOLD_SOCIAL  , :ARTICLE_TAX_WITHHOLD_SOCIAL.id2name)
    @@REF_TAX_WITHHOLD_PART      = Symbolic.new(ArticleCode.ARTICLE_TAX_WITHHOLD_PART    , :ARTICLE_TAX_WITHHOLD_PART.id2name)
    @@REF_TAX_WITHHOLD_BASE      = Symbolic.new(ArticleCode.ARTICLE_TAX_WITHHOLD_BASE    , :ARTICLE_TAX_WITHHOLD_BASE.id2name)
    @@REF_TAX_WITHHOLD           = Symbolic.new(ArticleCode.ARTICLE_TAX_WITHHOLD         , :ARTICLE_TAX_WITHHOLD.id2name)
    @@REF_INCOME_GROSS           = Symbolic.new(ArticleCode.ARTICLE_INCOME_GROSS         , :ARTICLE_INCOME_GROSS.id2name)
    @@REF_INCOME_NETTO           = Symbolic.new(ArticleCode.ARTICLE_INCOME_NETTO         , :ARTICLE_INCOME_NETTO.id2name)
  end
end

