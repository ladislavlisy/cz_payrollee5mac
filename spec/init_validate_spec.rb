require 'rspec'
require 'spec_helper'

describe 'init rspec validation' do
  it 'should fail' do
    true.should == false
  end

  it 'should succeeded' do
    true.should == true
  end
end