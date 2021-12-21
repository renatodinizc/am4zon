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

  it 'author to platform and cannot leave blank fields successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new author'
    click_on 'Create Author'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Citizenship can't be blank"
    expect(page).not_to have_content 'New author created successfully!'
  end

  it 'genre to platform successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new genre'
    fill_in 'Title', with: 'Fantasy'
    click_on 'Create Genre'

    expect(page).to have_current_path admin_path(admin)
    expect(page).to have_content 'New genre created successfully!'
  end

  it 'genre to platform and cannot leave blank fields successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new genre'
    click_on 'Create Genre'

    expect(page).to have_content "Title can't be blank"
    expect(page).not_to have_content 'New genre created successfully!'
  end

  it 'book to platform successfully' do
    admin = create(:admin)
    create(:author, name: 'J.R.R. Tolkien')
    create(:genre, title: 'Fantasy')

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book'
    fill_in 'Title', with: 'The Lord of the Rings: The Return of the King'
    fill_in 'Description', with: 'The third and final volume of the series'
    select 'J.R.R. Tolkien', from: 'Author'
    select 'Fantasy', from: 'Genre'
    click_on 'Create Book'

    expect(page).to have_current_path admin_path(admin)
    expect(page).to have_content 'New book created successfully!'
  end

  it 'genre to platform and cannot leave blank fields successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book'
    click_on 'Create Book'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content 'Author must exist'
    expect(page).to have_content 'Genre must exist'
    expect(page).not_to have_content 'New book created successfully!'
  end
end
