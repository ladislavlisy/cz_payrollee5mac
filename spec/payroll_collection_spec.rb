require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5


describe 'Payroll Concept Collection' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @concept_factor = SalaryBaseArticle.new
  end

  describe 'Salary CONCEPT_SALARY_MONTHLY' do

    it 'returns code CONCEPT_SALARY_MONTHLY for new Concept' do
      concept_item = @payroll_config.concept_from_models(@concept_factor.concept, @concept_factor.code)
      concept_item.name.should == 'CONCEPT_SALARY_MONTHLY'
      concept_item.code.should == ConceptCode::CONCEPT_SALARY_MONTHLY
      concept_item.article_code.should == ArticleCode::ARTICLE_UNKNOWN
    end

  end

end

describe 'Payroll Article Collection' do

  before(:each) do
    @payroll_config = PayrollSetup.create
    @concept_factor = SalaryBaseArticle.new
  end

  describe 'Salary ARTICLE_SALARY_BASE' do

    it 'returns code ARTICLE_SALARY_BASE for new Article' do
      article_item = @payroll_config.article_from_models(@concept_factor)
      article_item.code.should == ArticleCode::ARTICLE_SALARY_BASE
      article_item.name.should == 'ARTICLE_SALARY_BASE'
      article_item.concept.code.should == ConceptCode::CONCEPT_SALARY_MONTHLY
    end

  end

end

