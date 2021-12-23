FactoryBot.define do
  factory :book_collection do
    sequence(:title) { |n| "Book collection #{n}" }
    description { 'Great collection of books' }
    book1 factory: :book
    book2 factory: :book
    book3 factory: :book
  end
end
