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

  context 'on buying item' do
    it 'has complete profile successfully' do
      user = User.new(email: 'user@gmail.com', password: '123123')

      user.valid?(:profile_complete?)
      
      expect(user.errors.full_messages_for(:name)).to include "Name can't be blank"
      expect(user.errors.full_messages_for(:birth_date)).to include "Birth date can't be blank"
      expect(user.errors.full_messages_for(:citizenship)).to include "Citizenship can't be blank"
      expect(user.errors.full_messages_for(:occupation)).to include "Occupation can't be blank"
      expect(user.errors.full_messages_for(:description)).to include "Description can't be blank"
    end
  end
end
