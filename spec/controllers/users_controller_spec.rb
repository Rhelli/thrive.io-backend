require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:steve) { User.create!(name: 'Steve', email: 'steve@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-01') }
  let!(:ben) { User.create!(name: 'Ben', email: 'ben@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-02') }
  let!(:alan) { User.create!(name: 'Alan', email: 'alan@email.com', password: 'password1', user_type: 'Advertising', dob: '1980-02-03') }

  context 'The User Controller Index Method' do
    it 'returns a list of users who are looking' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:users).count).to eq(2)
    end

    it 'formats each user using the serializer correctly' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:users).first.name).to eq('Steve')
    end

    it 'does not display advertising users' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:users)).to_not include(alan)
    end
  end
end
