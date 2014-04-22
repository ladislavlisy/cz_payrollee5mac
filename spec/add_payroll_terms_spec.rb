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
    payroll_part = payroll_calc.last_party

    payroll_eval.code.should == ArticleConstants.REF_EMPLOYMENT_TERM.code
    payroll_part.contract_order.should == 1
    payroll_part.position_order.should == 0
  end

  it 'should add position' do

    payroll_setup = PayrollSetup.create

    payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')

    payroll_calc = PayrollCalculation.
        create_payroll(payroll_period, payroll_setup).
        add_contract_party(TypeContract.EMPLOYMENT, nil, nil).
        add_position_party(nil, nil)

    payroll_eval = payroll_calc.last_token
    payroll_part = payroll_calc.last_party

    payroll_eval.code.should == ArticleConstants.REF_POSITION_TERM.code
    payroll_part.contract_order.should == 1
    payroll_part.position_order.should == 1
  end

  it 'should add schedule and salary' do

    payroll_setup = PayrollSetup.create

    payroll_period = PayrollPeriod.new(2014, 1, 'January 2014')

    payroll_calc = PayrollCalculation.
        create_payroll(payroll_period, payroll_setup).
        add_contract_party(TypeContract.EMPLOYMENT, nil, nil).
        add_position_party(nil, nil).
        add_schedule_into_position(TypeSchedule.UNIFORM_WEEK, 40).
        add_salary_into_position(15000)

    payroll_eval = payroll_calc.last_token
    payroll_part = payroll_calc.last_party

    payroll_eval.code.should == ArticleConstants.REF_SALARY_BASE.code
    payroll_part.contract_order.should == 1
    payroll_part.position_order.should == 1

  end

end