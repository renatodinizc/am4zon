require 'rails_helper'

describe 'Admin adds new' do
  it 'author to platform successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new author'
    fill_in 'Name', with: 'Eiichiro Oda'
    fill_in 'Citizenship', with: 'Japanese'
    click_on 'Create Author'

    expect(page).to have_current_path admin_path(admin)
    expect(page).to have_content 'New author created successfully!'
  end

  it 'book to platform successfully' do
    admin = create(:admin)
    create(:author, name: 'J.R.R. Tolkien')

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book'
    fill_in 'Title', with: 'The Lord of the Rings: The Return of the King'
    fill_in 'Description', with: 'Is the third and final volume of the series'
    select 'J.R.R. Tolkien', from: 'Author'
    click_on 'Create Book'

    expect(page).to have_current_path admin_path(admin)
    expect(page).to have_content 'New book created successfully!'
  end
end