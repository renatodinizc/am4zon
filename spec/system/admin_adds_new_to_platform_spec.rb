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

  it 'book to platform and cannot leave blank fields successfully' do
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

  it 'book collection to platform successfully' do
    admin = create(:admin)
    create(:book, title: "Harry Potter and the Sorcerer's Stone")
    create(:book, title: 'Harry Potter and the Chamber of Secrets')
    create(:book, title: 'Harry Potter and the Prisoner of Azkaban')
    create(:book, title: 'Harry Potter and the Goblet of Fire')
    create(:book, title: 'Harry Potter and the Order of the Phoenix')
    create(:book, title: 'Harry Potter and the Half-Blood Prince')
    create(:book, title: 'Harry Potter and the Deathly Hallows')

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book collection'
    fill_in 'Title', with: 'Harry Potter series collection'
    fill_in 'Description', with: 'Collection of the original wizardry series'
    select "Harry Potter and the Sorcerer's Stone", from: 'Book1'
    select 'Harry Potter and the Chamber of Secrets', from: 'Book2'
    select 'Harry Potter and the Prisoner of Azkaban', from: 'Book3'
    select 'Harry Potter and the Goblet of Fire', from: 'Book4'
    select 'Harry Potter and the Order of the Phoenix', from: 'Book5'
    select 'Harry Potter and the Half-Blood Prince', from: 'Book6'
    select 'Harry Potter and the Deathly Hallows', from: 'Book7'
    click_on 'Create Book collection'

    expect(page).to have_current_path admin_path(admin)
    expect(page).to have_content 'New book collection created successfully!'
  end

  it 'book collection and cannot leave the first three books empty' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book collection'
    fill_in 'Title', with: 'Harry Potter series collection'
    fill_in 'Description', with: 'Collection of the original wizardry series'
    click_on 'Create Book collection'

    expect(page).not_to have_content 'New book collection created successfully!'
    expect(page).to have_content 'Book1 must exist'
    expect(page).to have_content 'Book2 must exist'
    expect(page).to have_content 'Book3 must exist'
  end

  it 'book collection and cannot leave title nor description empty' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book collection'
    click_on 'Create Book collection'

    expect(page).not_to have_content 'New book collection created successfully!'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  it 'book collection and it must contain only unique books' do
    admin = create(:admin)
    create(:book, title: "Harry Potter and the Sorcerer's Stone")

    login_as admin, scope: :admin
    visit root_path
    click_on 'My Control Panel'
    click_on 'Add new book collection'
    select "Harry Potter and the Sorcerer's Stone", from: 'Book1'
    select "Harry Potter and the Sorcerer's Stone", from: 'Book2'
    click_on 'Create Book collection'

    expect(page).not_to have_content 'New book collection created successfully!'
    expect(page).to have_content 'Collection cannot have duplicated items'
  end
end
