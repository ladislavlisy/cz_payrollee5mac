require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'prepare payroll calculation' do

  it 'should add contract' do

    payroll_setup = PayrollSetup.new
    payroll_setup.init_articles_and_concepts

    init_specs = Hash.new

    true.should == false
  end
end