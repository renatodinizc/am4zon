FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Book#{n}" }
    description { 'Greate book' }
    author
    genre
  end
end
