require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'Tax base rounding up' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

  it 'Tax base under 100 CZK should be round up to 1 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_TAX_ADVANCE_BASE,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    tax_declared = 1
    test_concept.tax_rounded_base(@period, tax_declared, 99, 99).should ==  99
    test_concept.tax_rounded_base(@period, tax_declared, 99.01, 99.01).should == 100
    test_concept.tax_rounded_base(@period, tax_declared, 100, 100).should == 100
  end

  it 'Tax base over 100 CZK should be round up to 100 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_TAX_ADVANCE_BASE,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    tax_declared = 1
    test_concept.tax_rounded_base(@period, tax_declared, 100.01, 100.01).should == 200
    test_concept.tax_rounded_base(@period, tax_declared, 101, 101).should == 200
  end

  it 'Tax advance from negative base should be 0 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_TAX_ADVANCE,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    test_concept.tax_adv_calculate(@period, -1, -1).should == 0
    test_concept.tax_adv_calculate(@period, 0, 0).should == 0
  end

  it 'Tax advance should be round up to 1 CZK' do
    factors_init = Hash.new
    factors_vals = {amount: 0}
    article_part = TermParty.get_empty
    factor_tuple = FactorsTupleBuilder.add_factor_by_symbol(factors_init,
                                                            article_part,
                                                            ArticleConstants::REF_TAX_ADVANCE,
                                                            factors_vals,
                                                            @payroll_config)
    test_facts = factor_tuple.last
    test_token = factor_tuple.first

    test_concept = test_facts[test_token]
    test_concept.tax_adv_calculate(@period, 3333, 3333).should == 500
    test_concept.tax_adv_calculate(@period, 2222, 2222).should == 334
  end
end

describe 'Insurance base rounding up' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')
  end

  it 'Health insurance should be round up to 1 CZK' do
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

  it 'Social insurance should be round up to 1 CZK' do
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