FactoryGirl.define do 

  factory :user do
    sequence (:name) { |n| "Name-#{n}" }                 
    sequence (:email) { |n| "email-#{n}@email.com" }                
    password              "foobar"
    password_confirmation "foobar"
  end

  factory :playlist do
    name "Workout"
    user
  end
end

