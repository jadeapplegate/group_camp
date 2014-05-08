require 'spec_helper'

describe Trip do
  
  describe 'arrival' do
    it 'should not be empty' do
      user = FactoryGirl.build(:trip, arrival: nil)
      user.should_not be_valid
    end
  end

describe 'departure' do
    it 'should not be empty' do
      user = FactoryGirl.build(:trip, departure: nil)
      user.should_not be_valid
    end
  end

describe 'name' do
    it 'should not be empty' do
      user = FactoryGirl.build(:trip, name: nil)
      user.should_not be_valid
    end
  end
describe 'description' do
    it 'should not be empty' do
      user = FactoryGirl.build(:trip, description: nil)
      user.should_not be_valid
    end
  end

end

  # validates :arrival, presence: true
  # validates :departure, presence: true
  # validates :name, presence: true
  # validates :description, presence: true
