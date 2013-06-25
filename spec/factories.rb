FactoryGirl.define do
  factory :administrator do
    sequence :username do |n|
      "admin#{n}"
    end
    password 'secret'
    password_confirmation 'secret'
  end
end
