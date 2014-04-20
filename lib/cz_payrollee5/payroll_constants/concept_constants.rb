require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class ConceptConstants
    cattr_reader :REF_UNKNOWN
    cattr_reader :REF_EMPLOYMENT_TERM
    cattr_reader :REF_AGREEMENT_WORK_TERM
    cattr_reader :REF_AGREEMENT_TASK_TERM
    cattr_reader :REF_POSITION_TERM
    cattr_reader :REF_SCHEDULE_WEEKLY
    cattr_reader :REF_SALARY_MONTHLY
    cattr_reader :REF_TIMESHEET_SCHEDULE
    cattr_reader :REF_TIMESHEET_WORKING
    cattr_reader :REF_TIMESHEET_ABSENCE
    cattr_reader :REF_HOURS_WORKING
    cattr_reader :REF_HOURS_ABSENCE
    cattr_reader :REF_INSURANCE_HEALTH_BASE
    cattr_reader :REF_INSURANCE_HEALTH
    cattr_reader :REF_INSURANCE_SOCIAL_BASE
    cattr_reader :REF_INSURANCE_SOCIAL
    cattr_reader :REF_SAVING_PENSION_BASE
    cattr_reader :REF_SAVING_PENSION
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

    @@REF_UNKNOWN                = Symbolic.new(ConceptCode.CONCEPT_UNKNOWN              , :CONCEPT_UNKNOWN.id2name)
    @@REF_EMPLOYMENT_TERM        = Symbolic.new(ConceptCode.CONCEPT_EMPLOYMENT_TERM      , :CONCEPT_EMPLOYMENT_TERM.id2name)
    @@REF_AGREEMENT_WORK_TERM    = Symbolic.new(ConceptCode.CONCEPT_AGREEMENT_WORK_TERM  , :CONCEPT_AGREEMENT_WORK_TERM.id2name)
    @@REF_AGREEMENT_TASK_TERM    = Symbolic.new(ConceptCode.CONCEPT_AGREEMENT_TASK_TERM  , :CONCEPT_AGREEMENT_TASK_TERM.id2name)
    @@REF_POSITION_TERM          = Symbolic.new(ConceptCode.CONCEPT_POSITION_TERM        , :CONCEPT_POSITION_TERM.id2name)
    @@REF_SCHEDULE_WEEKLY        = Symbolic.new(ConceptCode.CONCEPT_SCHEDULE_WEEKLY      , :CONCEPT_SCHEDULE_WEEKLY.id2name)
    @@REF_SALARY_MONTHLY         = Symbolic.new(ConceptCode.CONCEPT_SALARY_MONTHLY       , :CONCEPT_SALARY_MONTHLY.id2name)
    @@REF_TIMESHEET_SCHEDULE     = Symbolic.new(ConceptCode.CONCEPT_TIMESHEET_SCHEDULE   , :CONCEPT_TIMESHEET_SCHEDULE.id2name)
    @@REF_TIMESHEET_WORKING      = Symbolic.new(ConceptCode.CONCEPT_TIMESHEET_WORKING    , :CONCEPT_TIMESHEET_WORKING.id2name)
    @@REF_TIMESHEET_ABSENCE      = Symbolic.new(ConceptCode.CONCEPT_TIMESHEET_ABSENCE    , :CONCEPT_TIMESHEET_ABSENCE.id2name)
    @@REF_HOURS_WORKING          = Symbolic.new(ConceptCode.CONCEPT_HOURS_WORKING        , :CONCEPT_HOURS_WORKING.id2name)
    @@REF_HOURS_ABSENCE          = Symbolic.new(ConceptCode.CONCEPT_HOURS_ABSENCE        , :CONCEPT_HOURS_ABSENCE.id2name)
    @@REF_INSURANCE_HEALTH_BASE  = Symbolic.new(ConceptCode.CONCEPT_INSURANCE_HEALTH_BASE, :CONCEPT_INSURANCE_HEALTH_BASE.id2name)
    @@REF_INSURANCE_HEALTH       = Symbolic.new(ConceptCode.CONCEPT_INSURANCE_HEALTH     , :CONCEPT_INSURANCE_HEALTH.id2name)
    @@REF_INSURANCE_SOCIAL_BASE  = Symbolic.new(ConceptCode.CONCEPT_INSURANCE_SOCIAL_BASE, :CONCEPT_INSURANCE_SOCIAL_BASE.id2name)
    @@REF_INSURANCE_SOCIAL       = Symbolic.new(ConceptCode.CONCEPT_INSURANCE_SOCIAL     , :CONCEPT_INSURANCE_SOCIAL.id2name)
    @@REF_SAVING_PENSION_BASE    = Symbolic.new(ConceptCode.CONCEPT_SAVING_PENSION_BASE  , :CONCEPT_SAVING_PENSION_BASE.id2name)
    @@REF_SAVING_PENSION         = Symbolic.new(ConceptCode.CONCEPT_SAVING_PENSION       , :CONCEPT_SAVING_PENSION.id2name)
    @@REF_TAX_INCOME             = Symbolic.new(ConceptCode.CONCEPT_TAX_INCOME           , :CONCEPT_TAX_INCOME.id2name)
    @@REF_TAX_INCOME_ADVANCE     = Symbolic.new(ConceptCode.CONCEPT_TAX_INCOME_ADVANCE   , :CONCEPT_TAX_INCOME_ADVANCE.id2name)
    @@REF_TAX_INCOME_WITHHOLD    = Symbolic.new(ConceptCode.CONCEPT_TAX_INCOME_WITHHOLD  , :CONCEPT_TAX_INCOME_WITHHOLD.id2name)
    @@REF_TAX_CLAIM_PAYER        = Symbolic.new(ConceptCode.CONCEPT_TAX_CLAIM_PAYER      , :CONCEPT_TAX_CLAIM_PAYER.id2name)
    @@REF_TAX_CLAIM_CHILD        = Symbolic.new(ConceptCode.CONCEPT_TAX_CLAIM_CHILD      , :CONCEPT_TAX_CLAIM_CHILD.id2name)
    @@REF_TAX_CLAIM_DISABILITY   = Symbolic.new(ConceptCode.CONCEPT_TAX_CLAIM_DISABILITY , :CONCEPT_TAX_CLAIM_DISABILITY.id2name)
    @@REF_TAX_CLAIM_STUDYING     = Symbolic.new(ConceptCode.CONCEPT_TAX_CLAIM_STUDYING   , :CONCEPT_TAX_CLAIM_STUDYING.id2name)
    @@REF_TAX_RELIEF_PAYER       = Symbolic.new(ConceptCode.CONCEPT_TAX_RELIEF_PAYER     , :CONCEPT_TAX_RELIEF_PAYER.id2name)
    @@REF_TAX_RELIEF_CHILD       = Symbolic.new(ConceptCode.CONCEPT_TAX_RELIEF_CHILD     , :CONCEPT_TAX_RELIEF_CHILD.id2name)
    @@REF_TAX_BONUS_CHILD        = Symbolic.new(ConceptCode.CONCEPT_TAX_BONUS_CHILD      , :CONCEPT_TAX_BONUS_CHILD.id2name)
    @@REF_TAX_ADVANCE_HEALTH     = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE_HEALTH   , :CONCEPT_TAX_ADVANCE_HEALTH.id2name)
    @@REF_TAX_ADVANCE_SOCIAL     = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE_SOCIAL   , :CONCEPT_TAX_ADVANCE_SOCIAL.id2name)
    @@REF_TAX_ADVANCE_PART       = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE_PART     , :CONCEPT_TAX_ADVANCE_PART.id2name)
    @@REF_TAX_ADVANCE_BASE       = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE_BASE     , :CONCEPT_TAX_ADVANCE_BASE.id2name)
    @@REF_TAX_SOLIDARY_BASE      = Symbolic.new(ConceptCode.CONCEPT_TAX_SOLIDARY_BASE    , :CONCEPT_TAX_SOLIDARY_BASE.id2name)
    @@REF_TAX_ADVANCE            = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE          , :CONCEPT_TAX_ADVANCE.id2name)
    @@REF_TAX_SOLIDARY           = Symbolic.new(ConceptCode.CONCEPT_TAX_SOLIDARY         , :CONCEPT_TAX_SOLIDARY.id2name)
    @@REF_TAX_ADVANCE_FINAL      = Symbolic.new(ConceptCode.CONCEPT_TAX_ADVANCE_FINAL    , :CONCEPT_TAX_ADVANCE_FINAL.id2name)
    @@REF_TAX_WITHHOLD_HEALTH    = Symbolic.new(ConceptCode.CONCEPT_TAX_WITHHOLD_HEALTH  , :CONCEPT_TAX_WITHHOLD_HEALTH.id2name)
    @@REF_TAX_WITHHOLD_SOCIAL    = Symbolic.new(ConceptCode.CONCEPT_TAX_WITHHOLD_SOCIAL  , :CONCEPT_TAX_WITHHOLD_SOCIAL.id2name)
    @@REF_TAX_WITHHOLD_PART      = Symbolic.new(ConceptCode.CONCEPT_TAX_WITHHOLD_PART    , :CONCEPT_TAX_WITHHOLD_PART.id2name)
    @@REF_TAX_WITHHOLD_BASE      = Symbolic.new(ConceptCode.CONCEPT_TAX_WITHHOLD_BASE    , :CONCEPT_TAX_WITHHOLD_BASE.id2name)
    @@REF_TAX_WITHHOLD           = Symbolic.new(ConceptCode.CONCEPT_TAX_WITHHOLD         , :CONCEPT_TAX_WITHHOLD.id2name)
    @@REF_INCOME_GROSS           = Symbolic.new(ConceptCode.CONCEPT_INCOME_GROSS         , :CONCEPT_INCOME_GROSS.id2name)
    @@REF_INCOME_NETTO           = Symbolic.new(ConceptCode.CONCEPT_INCOME_NETTO         , :CONCEPT_INCOME_NETTO.id2name)
  end
end