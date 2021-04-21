require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:steve) { User.create!(name: 'Steve', email: 'steve@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-01') }
  let!(:ben) { User.create!(name: 'Ben', email: 'ben@email.com', password: 'password1', user_type: 'Looking', dob: '1980-02-02') }
end