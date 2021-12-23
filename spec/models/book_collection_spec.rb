require 'rails_helper'

describe BookCollection do
  context 'validation on' do
    it 'attributes successfully' do
      book_collection = BookCollection.new

      book_collection.valid?

      expect(book_collection.errors.full_messages_for(:title))
        .to include "Title can't be blank"
      expect(book_collection.errors.full_messages_for(:description))
        .to include "Description can't be blank"
      expect(book_collection.errors.full_messages_for(:book1))
        .to include 'Book1 must exist'
      expect(book_collection.errors.full_messages_for(:book2))
        .to include 'Book2 must exist'
      expect(book_collection.errors.full_messages_for(:book3))
        .to include 'Book3 must exist'
    end

    it 'associations successfully' do
      expect(BookCollection.reflect_on_association(:book1).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book2).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book3).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book4).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book5).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book6).macro)
        .to eq :belongs_to
      expect(BookCollection.reflect_on_association(:book7).macro)
        .to eq :belongs_to
    end
  end

  context 'uniqueness of' do
    it 'book elements successfully' do
      book1 = create(:book, title: 'Book 1')
      book_collection = BookCollection.new(book1: book1, book2: book1)
      book_collection.valid?

      expect(book_collection.errors.full_messages_for(:base))
        .to include 'Collection cannot have duplicated items'
    end

    it 'book collection title successfully' do
      create(:book_collection, title: 'Beautifull book collection')
      book_collection = BookCollection.new(title: 'Beautifull book collection')

      book_collection.valid?

      expect(book_collection.errors.full_messages_for(:title))
        .to include 'Title has already been taken'
    end
  end
end
