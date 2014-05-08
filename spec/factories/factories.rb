
FactoryGirl.define do

  sequence :email do |n|
    "jackie#{n}@jackie.com"
  end

  # factory :recipe do
  #   name "Chicken"
  #   course "Dinner"
  #   user
  # end

  factory :user do
    name "Jackie"
    email 
    password "password"
    password_confirmation "password"
  end

end