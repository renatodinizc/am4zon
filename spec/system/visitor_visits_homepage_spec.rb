require 'rails_helper'

describe 'Visitor visits home page' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content 'Welcome to Am4zon'
    expect(page).to have_content 'Your new favorite online bookstore'
  end

  it 'and sees full list of books avaiable successfully' do
    author = create(:author, name: 'J.K. Rowling', citizenship: 'British')
    author2 = create(:author, name: 'Ayn Rand', citizenship: 'Russian')
    create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                  description: 'Third title of the series',
                  author: author)
    create(:book, title: 'The Fountainhead',
                  description: 'One of Rands greatest novels',
                  author: author2)

    visit root_path

    expect(page).to have_content 'Harry Potter and the prisoner of Azkaban'
    expect(page).to have_content 'Description: Third title of the series'
    expect(page).to have_content 'Author: J.K. Rowling'
    expect(page).to have_content 'The Fountainhead'
    expect(page).to have_content 'One of Rands greatest novels'
    expect(page).to have_content 'Ayn Rand'
  end

  it 'and sees standard message if there are no books avaible' do
    visit root_path

    expect(page).to have_content 'There are no current avaiable books'
  end

  it 'and access books details successfully' do
    author = create(:author, name: 'J.K. Rowling', citizenship: 'British')
    create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                  description: 'Third title of the series',
                  author: author)
    create(:book, title: 'The Fountainhead',
                  description: 'One of Rands greatest novels')

    visit root_path
    click_on 'Harry Potter and the prisoner of Azkaban'

    expect(page).to have_content 'Harry Potter and the prisoner of Azkaban'
    expect(page).not_to have_content 'The Fountainhead'
    expect(page).to have_link 'Back to home page'
  end

  it 'sees book details and comes back to home page via layout button' do
    create(:book, title: 'Harry Potter and the prisoner of Azkaban',
                  description: 'Third title of the series')

    visit root_path
    click_on 'Harry Potter and the prisoner of Azkaban'
    click_on 'Home page'

    expect(page).to have_current_path root_path
    expect(page).to have_content 'Welcome to Am4zon'
  end

  it 'sees book details and access author details' do
    jk_rowling = create(:author, name: 'J.K. Rowling', citizenship: 'British')
    james_stewart = create(:author, name: 'James Stewart')
    create(:book, title: 'Harry Potter and the Deathly Hallows',
                  author: jk_rowling)
    create(:book, title: 'Harry Potter and Goblet of Fire', author: jk_rowling)
    create(:book, title: 'Harry Potter and the Half-Blood Prince',
                  author: jk_rowling)
    create(:book, title: 'Essential Calculus with Differential Equations',
                  author: james_stewart)

    visit root_path
    click_on 'Harry Potter and the Deathly Hallows'
    click_on 'J.K. Rowling'

    expect(page).to have_content 'Name: J.K. Rowling'
    expect(page).to have_content 'Citizenship: British'
    expect(page).to have_content 'Books from the author'
    expect(page).to have_content 'Harry Potter and the Deathly Hallows'
    expect(page).to have_content 'Harry Potter and Goblet of Fire'
    expect(page).to have_content 'Harry Potter and the Half-Blood Prince'
    expect(page).not_to have_content 'James Stewart'
    expect(page)
      .not_to have_content 'Essential Calculus with Differential Equations'
  end
end
