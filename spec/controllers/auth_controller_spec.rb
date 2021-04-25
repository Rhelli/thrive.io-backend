require 'rails_helper'

RSpec.describe Api::V1::AuthController, type: :controller do
  let!(:steve) { User.create!(name: 'Steve', email: 'steve@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-01') }

  context 'The Auth Controller Create method' do
    it 'allows a user to authenticate themselves successfully' do
      post :create, params: { user: { email: 'steve@email.com', password: 'password1' } }
      expect(response).to have_http_status(:accepted)
      expect(assigns(:user).name).to eq('Steve')
    end

    it 'does not allow a user to be authenticated with incorrect details' do
      post :create, params: { user: { email: 'mary@email.com', password: 'password1' } }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
