FactoryBot.define do
  factory :genre do
    sequence(:title) { |n| "Genre #{n}" }
  end
end
