
FactoryGirl.define do

  sequence :email do |n|
    "jackie#{n}@jackie.com"
  end

  factory :user do
    name "Jackie"
    email 
    password "password"
    password_confirmation "password"
  end

  factory :trip do
    arrival "07/09/2014"
    departure "07/15/2014"
    name "Yosemite Trip"
    description "Birthday Weekend"
  end

  factory :guest do
    name "Luke"
  end

end