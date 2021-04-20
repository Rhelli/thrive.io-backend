require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:steve) { User.create!(name: 'Steve', email: 'steve@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-01') }
  let!(:ben) { User.create!(name: 'Ben', email: 'ben@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-02') }

  before(:each) do
    allow_any_instance_of(ApplicationController).
    to receive(:current_user).and_return(@user)
  end

  context 'creating a new user' do
    it 'rejects the creation of a new user with the incorrect params' do
    end
  end
end