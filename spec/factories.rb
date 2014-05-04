FactoryGirl.define do
  factory :administrator do
    sequence(:username) { |n| "admin#{n}#{Random.rand(100)}" }
    password 'secret'
    password_confirmation 'secret'
  end

  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:room) { |n| "#{n}" }
    visible true
  end

  factory :metum do
    cash 100.0
    loss 10.0
    stock 1400.0
  end

  factory :product do
    sequence(:name) { |n| "Beer#{n}" }
    price 5.0
  end

  factory :bill do
    association :product
    association :user
    price 5.0
    quantity 10
  end
end
