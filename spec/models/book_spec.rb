require 'rails_helper'

describe Book do
  context 'validation on' do
    it 'attributtes successfully' do
      book = Book.new(price: nil)

      book.valid?

      expect(book.errors.full_messages_for(:title))
        .to include "Title can't be blank"
      expect(book.errors.full_messages_for(:description))
        .to include "Description can't be blank"
      expect(book.errors.full_messages_for(:price))
        .to include "Price can't be blank"
      expect(book.errors.full_messages_for(:author))
        .to include 'Author must exist'
      expect(book.errors.full_messages_for(:genre))
        .to include 'Genre must exist'
    end

    it 'associations successfully' do
      expect(Book.reflect_on_association(:author).macro).to eq :belongs_to
    end
  end
end
