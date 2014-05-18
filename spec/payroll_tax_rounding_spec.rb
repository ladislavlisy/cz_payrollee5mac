require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'Tax base rounding up' do

  before(:each) do
    @tax_engine = CzTaxEngine2013.new
  end

  it 'Tax base under 100 CZK should be round up to 1 CZK' do
    tax_declared = 1

    @tax_engine.tax_base_rounded(tax_declared, 99, 99).should ==  99
    @tax_engine.tax_base_rounded(tax_declared, 99.01, 99.01).should == 100
    @tax_engine.tax_base_rounded(tax_declared, 100, 100).should == 100
  end

  it 'Tax base over 100 CZK should be round up to 100 CZK' do
    tax_declared = 1

    @tax_engine.tax_base_rounded(tax_declared, 100.01, 100.01).should == 200
    @tax_engine.tax_base_rounded(tax_declared, 101, 101).should == 200
  end

  it 'Tax advance from negative base should be 0 CZK' do
    @tax_engine.tax_advance_result(-1, -1).should == 0
    @tax_engine.tax_advance_result(0, 0).should == 0
  end

  it 'Tax advance should be round up to 1 CZK' do
    @tax_engine.tax_advance_result(3333, 3333).should == 500
    @tax_engine.tax_advance_result(2222, 2222).should == 334
  end
end
