require 'rspec'
require 'GenerateCode/generate_code'

describe 'generate articles' do

  it 'should create classes' do
    constant_article = [
       "UNKNOWN                    ",
       "PAYROLL_PERIOD             ",
       "EMPLOYMENT_TERM            ",
       "AGREEMENT_WORK_TERM        ",
       "AGREEMENT_TASK_TERM        ",
       "POSITION_TERM              ",
       "SCHEDULE_WORK              ",
       "SALARY_BASE                ",
       "TIMESHEET_SCHEDULE         ",
       "TIMESHEET_WORKING          ",
       "TIMESHEET_ABSENCE          ",
       "HOURS_WORKING              ",
       "HOURS_ABSENCE              ",
       "INSURANCE_HEALTH_BASE      ",
       "INSURANCE_HEALTH           ",
       "INSURANCE_SOCIAL_BASE      ",
       "INSURANCE_SOCIAL           ",
       "SAVING_PENSION_BASE        ",
       "SAVING_PENSION             ",
       "TAX_INCOME                 ",
       "TAX_ADVANCE_INCOME         ",
       "TAX_WITHHOLD_INCOME        ",
       "TAX_CLAIM_PAYER            ",
       "TAX_CLAIM_CHILD            ",
       "TAX_CLAIM_DISABILITY       ",
       "TAX_CLAIM_STUDYING         ",
       "TAX_RELIEF_PAYER           ",
       "TAX_RELIEF_CHILD           ",
       "TAX_BONUS_CHILD            ",
       "TAX_ADVANCE_HEALTH         ",
       "TAX_ADVANCE_SOCIAL         ",
       "TAX_ADVANCE_PART           ",
       "TAX_ADVANCE_BASE           ",
       "TAX_SOLIDARY_BASE          ",
       "TAX_ADVANCE                ",
       "TAX_SOLIDARY               ",
       "TAX_ADVANCE_FINAL          ",
       "TAX_WITHHOLD_HEALTH        ",
       "TAX_WITHHOLD_SOCIAL        ",
       "TAX_WITHHOLD_PART          ",
       "TAX_WITHHOLD_BASE          ",
       "TAX_WITHHOLD               ",
       "INCOME_GROSS               ",
       "INCOME_NETTO               "
    ]

    generator = GenerateCode.new(
        #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Template\\'
        '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/templates/'
    )

    constant_article.each do |article_constant|
      generator.generate_file(article_constant, 'article_template.rb', '_article.rb',
          #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Articles\\'
          '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/outputs/payroll_articles/'
      )
    end

    true.should == true
  end
end

describe 'generate concepts' do

  it 'should create classes' do
    constant_concept = [
        'UNKNOWN                   ',
        'PAYROLL_PERIOD            ',
        'EMPLOYMENT_TERM           ',
        'AGREEMENT_WORK_TERM       ',
        'AGREEMENT_TASK_TERM       ',
        'POSITION_TERM             ',
        'SCHEDULE_WORK             ',
        'SALARY_BASE               ',
        'TIMESHEET_SCHEDULE        ',
        'TIMESHEET_WORKING         ',
        'TIMESHEET_ABSENCE         ',
        'HOURS_WORKING             ',
        'HOURS_ABSENCE             ',
        'INSURANCE_HEALTH_BASE     ',
        'INSURANCE_HEALTH          ',
        'INSURANCE_SOCIAL_BASE     ',
        'INSURANCE_SOCIAL          ',
        'SAVING_PENSION_BASE       ',
        'SAVING_PENSION            ',
        'TAX_INCOME                ',
        'TAX_ADVANCE_INCOME        ',
        'TAX_WITHHOLD_INCOME       ',
        'TAX_CLAIM_PAYER           ',
        'TAX_CLAIM_CHILD           ',
        'TAX_CLAIM_DISABILITY      ',
        'TAX_CLAIM_STUDYING        ',
        'TAX_RELIEF_PAYER          ',
        'TAX_RELIEF_CHILD          ',
        'TAX_BONUS_CHILD           ',
        'TAX_ADVANCE_HEALTH        ',
        'TAX_ADVANCE_SOCIAL        ',
        'TAX_ADVANCE_PART          ',
        'TAX_ADVANCE_BASE          ',
        'TAX_SOLIDARY_BASE         ',
        'TAX_ADVANCE               ',
        'TAX_SOLIDARY              ',
        'TAX_ADVANCE_FINAL         ',
        'TAX_WITHHOLD_HEALTH       ',
        'TAX_WITHHOLD_SOCIAL       ',
        'TAX_WITHHOLD_PART         ',
        'TAX_WITHHOLD_BASE         ',
        'TAX_WITHHOLD              ',
        'INCOME_GROSS              ',
        'INCOME_NETTO              '
    ]
    generator = GenerateCode.new(
        #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Template\\'
        '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/templates/'
    )

    constant_concept.each do |concept_constant|
      generator.generate_file(concept_constant, 'concept_template.rb', '_concept.rb',
           #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Concepts\\'
           '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/outputs/payroll_concepts/'
      )
    end

    true.should == true
  end
end

describe 'generate results' do

  it 'should create classes' do
    constant_result = [
        'UNKNOWN           ',
        'AMOUNT            ',
        'INCOME_BASE       ',
        'PAYMENT_DEDUCTION ',
        'PAYMENT_INCOME    ',
        'SCHEDULE          ',
        'TAX_DUTY          ',
        'TAX_CLAIM         ',
        'TAX_RELIEF        ',
        'TERM_EFFECT       ',
        'TERM_HOURS        ',
        'TIMESHEET         '
    ]
    generator = GenerateCode.new(
        #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Template\\'
        '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/templates/'
    )

    constant_result.each do |result_constant|
      generator.generate_file(result_constant, 'result_template.rb', '_result.rb',
           #'C:\\!APROJEKTY\\cz_payrollee5\\spec\\GenerateCode\\Results\\'
           '/Users/ladislavlisy/DEVX_RUBYRAILS/cz_payrollee5/spec/generate_code/outputs/payroll_results/'
      )
    end

    true.should == true
  end
end
