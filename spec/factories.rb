FactoryGirl.define do
  factory :administrator do
    sequence :username do |n|
      "admin#{n}"
    end
    password 'secret'
    password_confirmation 'secret'
  end

  factory :user do
    sequence :name do |n|
      "user#{n}"
    end
    sequence :room do |n|
      "#{n}"
    end
    visible true
  end

  factory :metum do
    cash 100.0
    loss 10.0
    stock 1400.0
  end

  factory :product do
    sequence :name do |n|
      "Beer#{n}"
    end
    price 5.0
  end

  factory :bill do
    association :product
    association :user
    price 5.0
    quantity 10
  end
end
