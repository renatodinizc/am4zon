require 'rails_helper'

describe 'Visitor visits home page' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content 'Welcome to Am4zon'
    expect(page).to have_content 'Your new favorite online bookstore'
  end
end
