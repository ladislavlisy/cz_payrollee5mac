require 'rspec'
require 'spec_helper'
require 'cz_payrollee5'
include CzPayrollee5

describe 'prepare payroll calculation' do

  it 'should add contract' do

    payroll_setup = PayrollSetup.create

    payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')

    payroll_calc = PayrollCalculation.
        create_payroll(payroll_period, payroll_setup).
        add_contract_party(TypeContract.EMPLOYMENT, nil, nil)

    payroll_eval = payroll_calc.last_token

    payroll_eval.code.should == ArticleConstants.REF_EMPLOYMENT_TERM.code
  end
end