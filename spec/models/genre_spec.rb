require 'rails_helper'

describe Genre do
  context 'validation on' do
    it 'attributes successfully' do
      genre = Genre.new

      genre.valid?

      expect(genre.errors.full_messages_for(:title))
        .to include "Title can't be blank"
    end

    it 'associations successfully' do
      expect(Genre.reflect_on_association(:books).macro).to eq :has_many
    end

    it 'unique name successfully' do
      create(:genre, title: 'Fantasy')
      genre = Genre.new(title: 'Fantasy')

      genre.valid?
      expect(genre.errors.full_messages_for(:title))
        .to include 'Title has already been taken'
    end
  end
end
