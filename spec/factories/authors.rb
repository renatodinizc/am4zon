FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "Author #{n}" }
    citizenship { 'MyString' }
  end
end
