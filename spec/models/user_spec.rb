require 'rails_helper'

describe User do
  context 'on account creation' do
    it 'cannot have insider email' do
      user = User.new(email: 'user@am4zon.com', password: '123123')

      user.valid?

      expect(user.errors.full_messages_for(:email)).to include
      'Email is of an invalid domain'
    end
  end
end
