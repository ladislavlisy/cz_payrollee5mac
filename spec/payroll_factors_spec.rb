require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'Payroll Process Factors' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @factors_queued = Hash.new
  end

  describe 'factor by article working schedule' do
    it 'returns weekly schedule hours 40' do
      article_code_part = TermParty.get_empty
      article_code_name = ArticleConstants.REF_SCHEDULE_WORK
      concept_init_hash = {hours_weekly: 40}
      article_fact_pair = FactorsTupleBuilder.add_factor_by_symbol(@factors_queued,
                                                                   article_code_part,
                                                                   article_code_name,
                                                                   concept_init_hash,
                                                                   @payroll_config)
      token_factor = article_fact_pair.first
      factors_arry = article_fact_pair.last
      concept_item = factors_arry[token_factor]

      concept_item.hours_weekly.should == 40
    end
  end

  describe 'factor by article base salary' do
    it 'returns monthly amount 15 000 CZK' do
      article_code_part = TermParty.get_empty
      article_code_name = ArticleConstants.REF_SALARY_BASE
      concept_init_hash = {amount_monthly: 15000}
      article_fact_pair = FactorsTupleBuilder.add_factor_by_symbol(@factors_queued,
                                                                   article_code_part,
                                                                   article_code_name,
                                                                   concept_init_hash,
                                                                   @payroll_config)
      token_factor = article_fact_pair.first
      factors_arry = article_fact_pair.last
      concept_item = factors_arry[token_factor]

      concept_item.amount_monthly.should == 15000
    end
  end

  describe 'Payroll Process Setup' do

    before(:each) do
      @payroll_config = PayrollSetup.create
      @factors_queued = Hash.new
    end

    describe 'inserting term and get code_order' do
      it 'returns code_order == 1 at beginning' do
        article_code_part = TermParty.get_empty
        article_code_name = ArticleConstants.REF_SCHEDULE_WORK
        concept_init_hash = {amount_monthly:  3000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     3,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  5000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     5,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  4000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     4,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  2000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     2,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  15000}
        article_fact_pair = FactorsTupleBuilder.add_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        token_factor = article_fact_pair.first
        token_factor.code_order.should == 1
      end

      it 'returns code_order == 3 in the middle' do
        article_code_part = TermParty.get_empty
        article_code_name = ArticleConstants.REF_SCHEDULE_WORK
        concept_init_hash = {amount_monthly:  5000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     5,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  1000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     1,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  4000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     4,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  2000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     2,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  13000}
        article_fact_pair = FactorsTupleBuilder.add_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        token_factor = article_fact_pair.first
        token_factor.code_order.should == 3
      end

      it 'returns code_order == 6 at the end' do
        article_code_part = TermParty.get_empty
        article_code_name = ArticleConstants.REF_SCHEDULE_WORK
        concept_init_hash = {amount_monthly:  3000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     3,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  5000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     5,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  1000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     1,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  4000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     4,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  2000}
        article_fact_pair = FactorsTupleBuilder.ins_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     2,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        @factors_queued = article_fact_pair.last
        concept_init_hash = {amount_monthly:  16000}
        article_fact_pair = FactorsTupleBuilder.add_factor_by_symbol(@factors_queued,
                                                                     article_code_part,
                                                                     article_code_name,
                                                                     concept_init_hash,
                                                                     @payroll_config)
        token_factor = article_fact_pair.first
        token_factor.code_order.should == 6
      end
    end
  end

end
