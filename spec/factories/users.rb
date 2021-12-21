FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { '123123' }
  end
end
