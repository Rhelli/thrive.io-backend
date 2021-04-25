require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do
  let!(:bob) { User.create!(name: 'Bob', email: 'bob@mail.com', password: 'password1', dob: '1979-01-01', user_type: 'Looking') }
  let!(:property1) do
    Property.create!(
      owner_id: bob.id,
      title: 'Lovely House',
      blurb: 'A small cottage',
      address: '10 Druiry Lane',
      town: 'London',
      postcode: 'NW12 1TN',
      price: 1200,
      deposit: 1200,
      bills: 'Included',
      furnished: 'Furnished',
      parking: 'No Parking',
      occupant_count: 2,
      room_count: 3
    )
  end

  context 'Properties Index Action' do
    it 'returns a list of all properties' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:properties).length).to eq(1)
    end

    it 'Formats the properties propertly using the serializer' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:properties).first.title).to eq('Lovely House')
      expect(assigns(:properties).first.deposit).to eq(1200)
    end
  end
end
