require 'rails_helper'

describe Book do
  context 'validation on' do
    it 'attributtes successfully' do
      book = Book.new

      book.valid?

      expect(book.errors.full_messages_for(:title))
        .to include "Title can't be blank"
      expect(book.errors.full_messages_for(:description))
        .to include "Description can't be blank"
    end

    it 'associations successfully' do
      expect(Book.reflect_on_association(:author).macro).to eq :belongs_to
    end
  end
end
