require 'rails_helper'

describe Author do
  context 'validation on' do
    it 'attributtes successfully' do
      author = Author.new

      author.valid?

      expect(author.errors.full_messages_for(:name))
        .to include "Name can't be blank"
      expect(author.errors.full_messages_for(:citizenship)).to include
      "Citizenship can't be blank"
    end

    it 'associations successfully' do
      expect(Author.reflect_on_association(:books).macro).to eq :has_many
    end

    it 'unique name successfully' do
      create(:author, name: 'Machado de Assis')
      author = Author.new(name: 'Machado de Assis')

      author.valid?

      expect(author.errors.full_messages_for(:name)).to include
      'Name has already been taken'
    end
  end
end
