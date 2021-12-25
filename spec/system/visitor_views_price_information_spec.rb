require 'rails_helper'

describe 'Visitor views price information' do
  it 'on a book sucessfully' do
    republic = create(:book, title: 'The Republic', price: 12)

    visit root_path
    click_on 'The Republic'

    expect(page).to have_current_path book_path republic
    expect(page).to have_content 'Price: $12'
  end

  it 'on a book collection sucessfully' do
    republic = create(:book, title: 'The Republic')
    collection = create(:book_collection, title: 'Plato and others',
                                          book1: republic, price: 99)

    visit root_path
    click_on 'The Republic'
    click_on 'Plato and others'

    expect(page).to have_current_path book_collection_path collection
    expect(page).to have_content 'Price: $99'
  end
end
