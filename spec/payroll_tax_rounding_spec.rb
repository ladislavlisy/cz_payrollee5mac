require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'TAX_ADVANCE_BASE rounding' do

  before(:each) do
    @tax_engine = CzTaxEngine2013.new
  end

  it 'TAX_ADVANCE_BASE under 100 CZK should be rounded UP to 1 CZK' do
    tax_declared = 1

    @tax_engine.tax_base_rounded(tax_declared, 99, 99).should ==  99
    @tax_engine.tax_base_rounded(tax_declared, 99.01, 99.01).should == 100
    @tax_engine.tax_base_rounded(tax_declared, 100, 100).should == 100
  end

  it 'TAX_ADVANCE_BASE over 100 CZK should be rounded UP to 100 CZK' do
    tax_declared = 1

    @tax_engine.tax_base_rounded(tax_declared, 100.01, 100.01).should == 200
    @tax_engine.tax_base_rounded(tax_declared, 101, 101).should == 200
  end
end

describe 'TAX_ADVANCE rounding' do

  before(:each) do
    @tax_engine = CzTaxEngine2013.new
  end

  it 'TAX_ADVANCE for negative TAX_ADVANCE_BASE should be 0 CZK' do
    @tax_engine.tax_advance_result(-1, -1).should == 0
    @tax_engine.tax_advance_result(0, 0).should == 0
  end

  it 'TAX_ADVANCE for positive TAX_ADVANCE_BASE should be round UP to 1 CZK' do
    @tax_engine.tax_advance_result(3333, 3333).should == 500
    @tax_engine.tax_advance_result(2222, 2222).should == 334
  end
end
