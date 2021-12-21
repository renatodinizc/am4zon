require 'rails_helper'

describe 'User edits own profile' do
  it 'to full completion successfully' do
    peter = create(:user, email: 'peter@gmail.com', password: '123123')

    login_as peter, scope: :user
    visit root_path
    click_on 'My Account'
    click_on 'Complete profile'
    fill_in 'Name', with: 'Peter McDonalds'
    fill_in 'Birth date', with: '20/03/1993'
    fill_in 'Occupation', with: 'Engineer'
    fill_in 'Citizenship', with: 'American'
    fill_in 'Description', with: 'I am an intelectual guy'
    click_on 'Update profile'

    expect(page).to have_current_path user_path(peter)
    expect(page).not_to have_content 'You still need to complete your profile!'
    expect(page).not_to have_link 'Complete profile'
    expect(page).to have_content 'Name: Peter McDonalds'
    expect(page).to have_content 'Birth date: 1993-03-20'
    expect(page).to have_content 'Citizenship: American'
    expect(page).to have_content 'Description: I am an intelectual guy'
  end
end
