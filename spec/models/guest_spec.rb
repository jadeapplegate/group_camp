require 'spec_helper'

describe Guest do

   describe 'name' do
    it 'should not be empty' do
      user = FactoryGirl.build(:guest, name: nil)
      user.should_not be_valid
    end
  end
  
end

