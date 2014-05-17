require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'Payroll Concept Factory' do

  before(:each) do
    @concept_factor = SalaryBaseArticle.new
  end

  describe 'Salary CONCEPT_SALARY_MONTHLY' do

    it 'returns class name SalaryMonthlyConcept' do
      ConceptFactory.classname_for(@concept_factor.concept_name).should == 'SalaryMonthlyConcept'
    end

    it 'returns code CONCEPT_SALARY_MONTHLY for new Concept' do
      concept_item = ConceptFactory.concept_for(@concept_factor.code, @concept_factor.concept_name, {amount_monthly: 0})
      concept_item.name.should == 'CONCEPT_SALARY_MONTHLY'
      concept_item.code.should == ConceptCode::CONCEPT_SALARY_MONTHLY
      concept_item.article_code.should == ArticleCode::ARTICLE_SALARY_BASE
    end

  end

end

describe 'Payroll Article Factory' do

  before(:each) do
    @concept_factor = SalaryBaseArticle.new
  end

  describe 'Salary ARTICLE_SALARY_BASE' do

    it 'returns class name SalaryBaseArticle' do
      ArticleFactory.classname_for(@concept_factor.name).should == 'SalaryBaseArticle'
    end

    it 'returns code ARTICLE_SALARY_BASE for new Article' do
      article_item = ArticleFactory.article_for(@concept_factor.name)
      article_item.code.should == ArticleCode::ARTICLE_SALARY_BASE
      article_item.name.should == 'ARTICLE_SALARY_BASE'
      article_item.concept.code.should == ConceptCode::CONCEPT_SALARY_MONTHLY
    end

  end

end

