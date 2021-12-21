require 'rails_helper'

describe 'Visitor uses search box' do
  it 'to find a book via its title successfully' do
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
    expect(page).not_to have_content 'The third and final volume of the series'
  end

  it 'to find an author via its name successfully' do
    create(:author, name: 'Aristotle')
    create(:author, name: 'Niels Bohr')
    create(:author, name: 'James Stewart')

    visit root_path
    fill_in 'Search', with: 'Bohr'
    click_on 'Search'

    expect(page).to have_content 'Niels Bohr'
    expect(page).not_to have_content 'Aristotle'
    expect(page).not_to have_content 'James Stewart'
  end

  it 'to find a book via an author successfully' do
    jk_rowling = create(:author, name: 'J.K. Rowling')
    create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                  description: 'Third title of the series', author: jk_rowling)
    create(:book, title: 'The Fountainhead',
                  description: 'One of Rands greatest novels')
    create(:book, title: 'The Lord of the Rings: The return of the King',
                  description: 'The third and final volume of the series')

    visit root_path
    fill_in 'Search', with: 'J.K.'
    click_on 'Search'
    expect(page).to have_content 'Harry Potter and the prisoner of Azkaban'
    expect(page).to have_content 'Third title of the series'
    expect(page).not_to have_content 'The Fountainhead'
    expect(page).not_to have_content 'One of Rands greatest novels'
  end
end
