FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@am4zon.com" }
    password { '123123' }
  end
end
