require 'active_support/core_ext/class/attribute_accessors'

module CzPayrollee5
  class ArticleCode
    cattr_reader :ARTICLE_UNKNOWN
    cattr_reader :ARTICLE_EMPLOYMENT_TERM
    cattr_reader :ARTICLE_AGREEMENT_WORK_TERM
    cattr_reader :ARTICLE_AGREEMENT_TASK_TERM
    cattr_reader :ARTICLE_POSITION_TERM
    cattr_reader :ARTICLE_SCHEDULE_WORK
    cattr_reader :ARTICLE_SALARY_BASE
    cattr_reader :ARTICLE_TIMESHEET_SCHEDULE
    cattr_reader :ARTICLE_TIMESHEET_WORKING
    cattr_reader :ARTICLE_TIMESHEET_ABSENCE
    cattr_reader :ARTICLE_HOURS_WORKING
    cattr_reader :ARTICLE_HOURS_ABSENCE
    cattr_reader :ARTICLE_INSURANCE_HEALTH_BASE
    cattr_reader :ARTICLE_INSURANCE_HEALTH
    cattr_reader :ARTICLE_INSURANCE_SOCIAL_BASE
    cattr_reader :ARTICLE_INSURANCE_SOCIAL
    cattr_reader :ARTICLE_SAVINGS_PENSION_BASE
    cattr_reader :ARTICLE_SAVINGS_PENSION
    cattr_reader :ARTICLE_TAX_INCOME
    cattr_reader :ARTICLE_TAX_INCOME_ADVANCE
    cattr_reader :ARTICLE_TAX_INCOME_WITHHOLD
    cattr_reader :ARTICLE_TAX_CLAIM_PAYER
    cattr_reader :ARTICLE_TAX_CLAIM_CHILD
    cattr_reader :ARTICLE_TAX_CLAIM_DISABILITY
    cattr_reader :ARTICLE_TAX_CLAIM_STUDYING
    cattr_reader :ARTICLE_TAX_RELIEF_PAYER
    cattr_reader :ARTICLE_TAX_RELIEF_CHILD
    cattr_reader :ARTICLE_TAX_BONUS_CHILD
    cattr_reader :ARTICLE_TAX_ADVANCE_HEALTH
    cattr_reader :ARTICLE_TAX_ADVANCE_SOCIAL
    cattr_reader :ARTICLE_TAX_ADVANCE_PART
    cattr_reader :ARTICLE_TAX_ADVANCE_BASE
    cattr_reader :ARTICLE_TAX_SOLIDARY_BASE
    cattr_reader :ARTICLE_TAX_ADVANCE
    cattr_reader :ARTICLE_TAX_SOLIDARY
    cattr_reader :ARTICLE_TAX_ADVANCE_FINAL
    cattr_reader :ARTICLE_TAX_WITHHOLD_HEALTH
    cattr_reader :ARTICLE_TAX_WITHHOLD_SOCIAL
    cattr_reader :ARTICLE_TAX_WITHHOLD_PART
    cattr_reader :ARTICLE_TAX_WITHHOLD_BASE
    cattr_reader :ARTICLE_TAX_WITHHOLD
    cattr_reader :ARTICLE_INCOME_GROSS
    cattr_reader :ARTICLE_INCOME_NETTO

    @@ARTICLE_UNKNOWN                    = 0
    @@ARTICLE_EMPLOYMENT_TERM            = 102
    @@ARTICLE_AGREEMENT_WORK_TERM        = 103
    @@ARTICLE_AGREEMENT_TASK_TERM        = 104
    @@ARTICLE_POSITION_TERM              = 110
    @@ARTICLE_SCHEDULE_WORK              = 201
    @@ARTICLE_SALARY_BASE                = 202
    @@ARTICLE_TIMESHEET_SCHEDULE         = 203
    @@ARTICLE_TIMESHEET_WORKING          = 204
    @@ARTICLE_TIMESHEET_ABSENCE          = 205
    @@ARTICLE_HOURS_WORKING              = 206
    @@ARTICLE_HOURS_ABSENCE              = 207
    @@ARTICLE_INSURANCE_HEALTH_BASE      = 301
    @@ARTICLE_INSURANCE_HEALTH           = 302
    @@ARTICLE_INSURANCE_SOCIAL_BASE      = 303
    @@ARTICLE_INSURANCE_SOCIAL           = 304
    @@ARTICLE_SAVINGS_PENSION_BASE       = 305
    @@ARTICLE_SAVINGS_PENSION            = 306
    @@ARTICLE_TAX_INCOME                 = 401
    @@ARTICLE_TAX_INCOME_ADVANCE         = 402
    @@ARTICLE_TAX_INCOME_WITHHOLD        = 403
    @@ARTICLE_TAX_CLAIM_PAYER            = 411
    @@ARTICLE_TAX_CLAIM_CHILD            = 412
    @@ARTICLE_TAX_CLAIM_DISABILITY       = 413
    @@ARTICLE_TAX_CLAIM_STUDYING         = 414
    @@ARTICLE_TAX_RELIEF_PAYER           = 421
    @@ARTICLE_TAX_RELIEF_CHILD           = 422
    @@ARTICLE_TAX_BONUS_CHILD            = 423
    @@ARTICLE_TAX_ADVANCE_HEALTH         = 431
    @@ARTICLE_TAX_ADVANCE_SOCIAL         = 432
    @@ARTICLE_TAX_ADVANCE_PART           = 433
    @@ARTICLE_TAX_ADVANCE_BASE           = 434
    @@ARTICLE_TAX_SOLIDARY_BASE          = 435
    @@ARTICLE_TAX_ADVANCE                = 436
    @@ARTICLE_TAX_SOLIDARY               = 437
    @@ARTICLE_TAX_ADVANCE_FINAL          = 438
    @@ARTICLE_TAX_WITHHOLD_HEALTH        = 441
    @@ARTICLE_TAX_WITHHOLD_SOCIAL        = 442
    @@ARTICLE_TAX_WITHHOLD_PART          = 443
    @@ARTICLE_TAX_WITHHOLD_BASE          = 444
    @@ARTICLE_TAX_WITHHOLD               = 445
    @@ARTICLE_INCOME_GROSS               = 501
    @@ARTICLE_INCOME_NETTO               = 502
  end
end
