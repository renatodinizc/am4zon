require 'rails_helper'

describe 'User visits home page' do
  it 'and creates new user account on platform successfully' do
    visit root_path
    click_on 'Create new User account'
    fill_in 'Email', with: 'peter@gmail.com'
    fill_in 'Password', with: '123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123', match: :prefer_exact
    click_on 'Sign up'

    expect(page).to have_content 'Welcome to Am4zon'
    expect(page).to have_content 'You have signed up successfully.'
    expect(page).to have_content 'peter@gmail.com is logged in as User'
  end

  it 'and logs into platform successfully' do
    create(:user, email: 'peter@gmail.com', password: '123123')

    visit root_path
    click_on 'Login as User'
    fill_in 'Email', with: 'peter@gmail.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'

    expect(page).to have_content 'Welcome to Am4zon'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'peter@gmail.com is logged in as User'
  end

  it 'log in and logs out successfully' do
    peter = create(:user, email: 'peter@gmail.com', password: '123123')

    login_as peter, scope: :user
    visit root_path
    click_on 'Log out'

    expect(page).to have_content 'Login as User'
    expect(page).to have_content 'Signed out successfully.'
    expect(page).not_to have_content 'Log out'
  end

  it 'and visits own profile successfully' do
    peter = create(:user, email: 'peter@gmail.com', password: '123123')

    login_as peter, scope: :user
    visit root_path
    click_on 'My Account'

    expect(page).to have_content 'Personal account of peter@gmail.com'
    expect(page).to have_content 'You still need to complete your profile!'
    expect(page).to have_link 'Complete profile'
    expect(page).to have_content 'My wish list'
    expect(page).not_to have_content 'Welcome to Am4zon'
  end
end
