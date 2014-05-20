require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'INSURANCE_HEALTH_BASE rounding' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

end

describe 'INSURANCE_HEALTH rounding' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

  it 'INSURANCE_HEALTH should be round UP to 1 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_INSURANCE_HEALTH,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    test_concept.insurance_contribution(@period, 3333, 3333).should == 150
    test_concept.insurance_contribution(@period, 2222, 2222).should == 100
  end
end

describe 'INSURANCE_SOCIAL_BASE rounding' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

end

describe 'INSURANCE_SOCIAL rounding' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

  it 'INSURANCE_SOCIAL should be round UP to 1 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_INSURANCE_SOCIAL,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    test_concept.insurance_contribution(@period, 3333).should == 217
    test_concept.insurance_contribution(@period, 2222).should == 145
  end
end