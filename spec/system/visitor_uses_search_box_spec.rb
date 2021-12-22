require 'rails_helper'

describe 'Visitor uses search box' do
  context 'to find' do
    it 'a book via its title successfully' do
      create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                    description: 'Third title of the series')
      create(:book, title: 'The Fountainhead',
                    description: 'One of Rands greatest novels')
      create(:book, title: 'The Lord of the Rings: The return of the King',
                    description: 'The third and final volume of the series')

      visit root_path
      fill_in 'Search', with: 'Fountainhead'
      click_on 'Search'

      expect(page).to have_link 'The Fountainhead'
      expect(page).to have_content 'Description: One of Rands greatest novels'
      expect(page).not_to have_link 'Harry Potter and the prisoner of Azkaban'
      expect(page).not_to have_content 'Third title of the series'
      expect(page)
        .not_to have_link 'The Lord of the Rings: The return of the King'
      expect(page)
        .not_to have_content 'The third and final volume of the series'
    end

    it 'an author via its name successfully' do
      aristotle = create(:author, name: 'Aristotle')
      bohr = create(:author, name: 'Niels Bohr')
      stewart = create(:author, name: 'James Stewart')
      create(:book, author: aristotle)
      create(:book, author: bohr)
      create(:book, author: stewart)

      visit root_path
      fill_in 'Search', with: 'Bohr'
      click_on 'Search'

      expect(page).to have_link 'Niels Bohr'
      expect(page).not_to have_link 'Aristotle'
      expect(page).not_to have_link 'James Stewart'
    end

    it 'an author only if it has at least one book at platform successfully' do
      create(:author, name: 'Aristotle', citizenship: 'Greek')

      visit root_path
      fill_in 'Search', with: 'Aristotle'
      click_on 'Search'

      expect(page).to have_content 'No valid authors were found'
      expect(page).not_to have_link 'Aristotle'
    end

    it 'a book via an author successfully' do
      jk_rowling = create(:author, name: 'J.K. Rowling')
      create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                    description: 'Third title of the series',
                    author: jk_rowling)
      create(:book, title: 'The Fountainhead',
                    description: 'One of Rands greatest novels')
      create(:book, title: 'The Lord of the Rings: The return of the King',
                    description: 'The third and final volume of the series')

      visit root_path
      fill_in 'Search', with: 'J.K.'
      click_on 'Search'
      expect(page).to have_link 'Harry Potter and the prisoner of Azkaban'
      expect(page).to have_content 'Third title of the series'
      expect(page).not_to have_link 'The Fountainhead'
      expect(page).not_to have_content 'One of Rands greatest novels'
    end
  end

  context 'get its results and access' do
    it 'author details page successfuly' do
      jk_rowling = create(:author, name: 'J.K. Rowling')
      create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                    description: 'Third title of the series',
                    author: jk_rowling)

      visit root_path
      fill_in 'Search', with: 'Harry Potter'
      click_on 'Search'
      click_on 'J.K. Rowling'

      expect(page).to have_current_path author_path(jk_rowling)
    end

    it 'author details page successfuly' do
      jk_rowling = create(:author, name: 'J.K. Rowling')
      book = create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                           description: 'Third title of the series',
                           author: jk_rowling)

      visit root_path
      fill_in 'Search', with: 'Harry Potter'
      click_on 'Search'
      click_on 'Harry Potter and the prisoner of Azkaban'

      expect(page).to have_current_path book_path(book)
    end
  end
end
