require 'rails_helper'

RSpec.describe Property, type: :model do
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

  context 'Property model validations for the title' do
    it 'Allows the creation of a property when correctly formatted' do
      new_property = Property.new(
        owner_id: bob.id,
        title: 'A Lovely Little House',
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
      expect(new_property).to be_valid
    end

    it 'Rejects the creation of a house without an owner' do
      new_property = Property.new(
        title: 'A Lovely Little House',
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
      expect(new_property).to_not be_valid
    end

    it 'Rejects the creation of a new house without a title' do
      new_property = Property.new(
        owner_id: bob.id,
        title: '',
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
      expect(new_property).to_not be_valid
    end

    it 'Rejects the creation of a new house with an incorrectly formatted title' do
      new_property = Property.new(
        owner_id: bob.id,
        title: 'A Lovely L@ttle H#$(*)_%&U _#$% !',
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
      expect(new_property).to_not be_valid
    end

    it 'Rejects the creation of a new house with a title over 140 characters' do
      new_property = Property.new(
        owner_id: bob.id,
        title: 'A' * 141,
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
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the blurb/description' do
    it 'Rejects the creation of a blurb with more than 3000 characters' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A' * 3001,
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
      expect(new_property).to_not be_valid
    end

    it 'Rejects the creation of a property without a blurb' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: '',
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
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the address' do
    it 'Rejects the creation of property without an address' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '',
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
      expect(new_property).to_not be_valid
    end

    it 'Rejects the creation of a property with an incorrectly formatted address' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane*%(^^%$%&$',
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
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a new property with an address with more than 3000 characters' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: 'A' * 3001,
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
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the town field' do
    it 'rejects the creation of a property with no town set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: '',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a new property wtih an incorrectly formatted town' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: '&#*$()&)%$#',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a new property with an town over 1000 characters' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'a' * 1001,
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model postcode validations' do
    it 'rejects the creation of a property with an incorrectly formatted postcode' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12(*&^',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a postcode over 8 characters' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TNqrwer3',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a postcode under 6 characters' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property without a postcode' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: '',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the price field' do
    it 'rejects the creation of a property without a price/rent set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: nil,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a price in the wrong format' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 'One hundred',
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a negative price/rent' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: -1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the deposit field' do
    it 'rejects the creation of a property without a deposit set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: nil,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a deposit in the wrong format' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 'One Thousand',
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with a negative deposit' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: -1200,
        bills: 'Included',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the bills field' do
    it 'rejects the creation of a new property with no bills option set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: '',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with an unlisted bill option' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Whack',
        furnished: 'Furnished',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the furnished field' do
    it 'rejects the creation of a property with no furnished option set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: '',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end

    it 'rejects the creation of a property with an unlisted furnished option set' do
      new_property = Property.create(
        owner_id: bob.id,
        title: 'Lovely House',
        blurb: 'A small cottage',
        address: '10 Druiry Lane',
        town: 'London',
        postcode: 'NW12 1TN',
        price: 1200,
        deposit: 1200,
        bills: 'Included',
        furnished: 'Furnished To The Max',
        parking: 'No Parking',
        occupant_count: 2,
        room_count: 3
      )
      expect(new_property).to_not be_valid
    end
  end

  context 'Property model validations for the parking option' do
    it 'rejects the creation of a new property without a parking option set' do
      expect(property1.update(parking: '')).to be_falsey
    end

    it 'rejects an unlisted parking option' do
      expect(property1.update(parking: 'None at all')).to be_falsey
    end
  end

  context 'Property model validations for the occupant count option' do
    it 'rejects a blank or nil occupant count' do
      expect(property1.update(occupant_count: nil)).to be_falsey
    end

    it 'rejects a negative occupant count' do
      expect(property1.update(occupant_count: -2000)).to be_falsey
    end

    it 'rejects an occupant count that is not an integer' do
      expect(property1.update(occupant_count: 'One')).to be_falsey
    end
  end

  context 'Property model validations for the room count option' do
    it 'rejects a nil room count entry' do
      expect(property1.update(room_count: nil)).to be_falsey
    end

    it 'rejects a room count that is less than one' do
      expect(property1.update(room_count: 0)).to be_falsey
    end

    it 'rejects a room count in any other format than an integer' do
      expect(property1.update(room_count: 'One')).to be_falsey
    end
  end

  context 'Property model validations for the outside area option' do
    it 'accepts a valid included outsode area option' do
      expect(property1.update(outside_area: ['Patio'])).to be_truthy
    end

    it 'rejects an outside area option that is not on the inclusive list' do
      expect(property1.update(outside_area: ['Pond'])).to be_falsey
    end

    it 'allows the outside area option to be empty' do
      expect(property1.update(outside_area: [])).to be_truthy
    end
  end

  context 'Property model validations for the disabled access option' do
    it 'accepts a valid disabled access option' do
      expect(property1.update(disabled_access: 'Disabled Access')).to be_truthy
    end

    it 'rejects a disabled access option not included on the list' do
      expect(property1.update(disabled_access: 'None available')).to be_falsey
    end

    it 'allows the disabled access option to be empty' do
      expect(property1.update(disabled_access: nil)).to be_truthy
    end
  end

  context 'Property model validations for the internet option' do
    it 'accepts a valid internet option' do
      expect(property1.update(internet: 'Internet Included')).to be_truthy
    end

    it 'rejects an internet option that is not included on the list' do
      expect(property1.update(internet: 'Starlink')).to be_falsey
    end

    it 'allows the internet option to be emtpy' do
      expect(property1.update(internet: nil)).to be_truthy
    end
  end

  context 'Property model validations for the minimum age validation' do
    it 'accepts a correctly formatted min age' do
      expect(property1.update(min_age: 24)).to be_truthy
    end

    it 'rejects a minimum age that is not an integer' do
      expect(property1.update(min_age: 'Thirty')).to be_falsey
    end

    it 'rejects a minimum age that is less than 18' do
      expect(property1.update(min_age: 15)).to be_falsey
    end

    it 'rejects a minimum age of over 125' do
      expect(property1.update(min_age: 126)).to be_falsey
    end
  end

  context 'Property model validations for the maximum age' do
    it 'rejects a max age of less than 18' do
      expect(property1.update(max_age: 17)).to be_falsey
    end

    it 'rejects a max age of over 125' do
      expect(property1.update(max_age: 126)).to be_falsey
    end

    it 'accepts a correctly formatted max age' do
      expect(property1.update(max_age: 35)).to be_truthy
    end

    it 'rejects a max age which is not an integer' do
      expect(property1.update(max_age: 'One hundred')).to be_falsey
    end
  end

  context 'Property model validations for the smoking option' do
    it 'accepts an included smoking option' do
      expect(property1.update(smoking: 'Smoking')).to be_truthy
    end

    it 'rejects a smoking option that is not on the list' do
      expect(property1.update(smoking: 'All day')).to be_falsey
    end
  end

  context 'Property model validations for the pets option' do
    it 'accepts valid included pets options' do
      expect(property1.update(pets: %w[Dogs Cats])).to be_truthy
    end

    it 'rejects an unlisted pet option' do
      expect(property1.update(pets: %w[Cats Camels])).to be_falsey
    end
  end

  context 'Property model validations for the genders field' do
    it 'accepts valid included gender options' do
      expect(property1.update(genders: %w[Male Male Female])).to be_truthy
    end

    it 'rejects unlisted gender options' do
      expect(property1.update(genders: %w[Male Female Android])).to be_falsey
    end
  end

  context 'Property model validations for the occupations option' do
    it 'accepts valid included occupation options' do
      expect(property1.update(occupations: %w[Professional Student])).to be_truthy
    end

    it 'rejects invalid unlisted occupation options' do
      expect(property1.update(occupations: ['Professional', 'Bin Man'])).to be_falsey
    end
  end
end
