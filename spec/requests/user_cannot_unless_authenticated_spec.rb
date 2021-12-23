require 'rails_helper'

describe 'User cannot,' do
  context 'unless authenticated,' do
    it 'access own profile' do
      create(:user, email: 'user@gmail.com')

      get '/users/1'

      expect(response).to redirect_to new_user_session_path
    end
  end

  context 'even authenticated' do
    it 'access another users profile successfully' do
      user1 = create(:user, email: 'user1@gmail.com')
      create(:user, email: 'user2@gmail.com')

      login_as user1, scope: :user
      get '/users/2'

      expect(response).to redirect_to user_path(user1)
    end

    it 'edit another users profile successfully' do
      user1 = create(:user, email: 'user1@gmail.com')
      create(:user, email: 'user2@gmail.com')

      login_as user1, scope: :user
      get '/users/2/edit'

      expect(response).to redirect_to user_path(user1)
    end
  end
end
