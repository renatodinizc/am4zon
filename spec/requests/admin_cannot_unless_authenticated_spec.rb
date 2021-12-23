require 'rails_helper'

describe 'Admin cannot,' do
  context 'unless authenticated,' do
    it 'view personal control panel successfully' do
      create(:admin, email: 'admin@am4zon.com')

      get '/admins/1'

      expect(response).to redirect_to new_admin_session_path
    end

    it 'create new genre on platform' do
      get '/genres/new'

      expect(response).to redirect_to new_admin_session_path
    end

    it 'create new author on platform' do
      get '/authors/new'

      expect(response).to redirect_to new_admin_session_path
    end

    it 'create new book on platform' do
      get '/books/new'

      expect(response).to redirect_to new_admin_session_path
    end

    it 'create new book collection on platform' do
      get '/book_collections/new'

      expect(response).to redirect_to new_admin_session_path
    end
  end

  context 'even authenticated' do
    it 'access another admin control panel successfully' do
      admin1 = create(:admin, email: 'admin1@am4zon.com')
      create(:admin, email: 'admin2@am4zon.com')

      login_as admin1, scope: :admin
      get '/admins/2'

      expect(response).to redirect_to admin_path(admin1)
    end
  end
end
