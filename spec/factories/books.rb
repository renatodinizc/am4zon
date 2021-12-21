FactoryBot.define do
  factory :book do
    title { 'MyString' }
    description { 'MyString' }
    author
    genre
  end
end
