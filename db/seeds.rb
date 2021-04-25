User.create!(
  name: 'Jim',
  email: 'jim@email.com',
  password: 'password1',
  user_type: 'Advertising',
  advertiser_type: 'Landlord',
  dob: '1980-12-12',
  about: "Hi! My name is Jim and I'm a retired Biology Teacher and part time trapeze artist. Recently my house was infested with termites and I lost everything! Now looking for a new house",
  occupation: 'Professional',
  gender: 'Male',
  couple: 'Non-Couple',
  pets: ['Cats', 'Dogs', 'Fish'],
  smoking: 'Non-Smoking',
  min_budget: 1500,
  max_budget: 2500,
  areas_looking: ['Clapham Common', 'Wimbledon', 'Mt.Everest', 'Waterloo'],
)

User.create!(
  name: 'Tim',
  email: 'tim@email.com',
  password: 'password1',
  user_type: 'Advertising',
  advertiser_type: 'Landlord',
  dob: '1980-12-12',
  about: "Hi! My name is Tim and I'm a retired Chemistry Teacher and part juggler. Recently my house was infested with ant-eaters and I lost everything! Now looking for a new flat",
  occupation: 'Professional',
  gender: 'Male',
  couple: 'Non-Couple',
  pets: ['Cats', 'Rodents', 'Birds'],
  smoking: 'Non-Smoking',
  min_budget: 1500,
  max_budget: 2500,
  areas_looking: ['Clapham Common', 'Wimbledon', 'Mt.Everest', 'Waterloo'],
)

@town_array = [
  'Camden', 'Balham', 'Clapham', 'Addlestone', 'Angel', 'Bankside', 'Barbican', 'Barking', 'Barnes',
  'Battersea', 'Bayswater', 'Belgravia', 'Belmont', 'Belvedere', 'Blackfriars', 'Brixton', 'Canary Wharf',
  'Chalk Farm', 'Charing Cross', 'Dulwich', 'Edgware', 'Farringdon', 'Fulham', 'Ham', 'Hampton Hill', 'Highgate',
  'Clapham Common', 'Wimbledon'
]

pets_array = [
  'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Fish', 
  'Reptiles', 'Birds', 'Rodents', 'Other', 'None', 'None', 'None', 'None', 'None',
  'None','None', 'None', 'None', 'None', 'None','None', 'None', 'None', 'None',
  'None','None', 'None', 'None', 'None', 'None','None', 'None', 'None', 'None',
  'None','None', 'None', 'None', 'None', 'None','None', 'None', 'None', 'None'
]
gender_array  = ['Male', 'Male', 'Female', 'Female', 'Female', 'Male', 'Transgender']
occupations_array = ['Professional', 'Professional', 'Student']

def budget_gen
  min = 0
  max = 0
  until min < max
    min = (rand(700..1600)/25).ceil * 25
    max = (rand(700..1600)/25).ceil * 25
  end
  return [min, max]
end

def age_range_gen
  min = 0
  max = 0
  until min < max
    min = rand(18..60)
    max = rand(18..60)
  end
  return [min, max]
end

def areas_looking_gen
  areas = []
  rand(1..5).times do
    town = @town_array.sample
    areas.push(town)
  end
  areas = areas.uniq
  areas
end

def array_gen(type, amount=nil)
  array = [];
  if amount
    amount.times do
      array.push(type.sample)
    end
  else
    rand(1..3).times do
      array.push(type.sample)
    end
  end
  return array;
end

def pets_array_reducer(arr)
  if arr.include?('None')
    return ['None']
  else
    return arr.uniq
  end
end

def advertiserTypeGen(type)
  if type == 'Advertising'
    return ['Flatmate', 'Landlord', 'Flatmate', 'Flatmate'].sample
  else
    return nil
  end
end

30.times do
  name = Faker::Name.first_name
  email = Faker::Internet.email
  password = 'password1'
  user_type = ['Looking', 'Advertising'].sample
  advertiser_type = advertiserTypeGen(user_type)
  dob = Faker::Date.between(from: '1920-01-01', to: '2002-01-01')
  about = Faker::Lorem.sentence
  avatar = 'someimageurl.com'
  occupation = ['Professional', 'Student', 'Professional'].sample
  smoking = ['Smoking', 'Non-Smoking', 'Non-Smoking', 'Occassionally'].sample
  gender  = [
    'Male', 'Male', 'Female', 'Female', 'Female', 'Male', 'Transgender',
    'Male', 'Male', 'Female', 'Female', 'Female', 'Male', 'Male', 'Male',
    'Female', 'Female', 'Female', 'Male',
  ].sample
  couple = ['Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Couple'].sample
  pets = [
    'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Fish', 
    'Reptiles', 'Birds', 'Rodents', 'Other', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None'
  ].sample
  min_budget = budget_gen[0]
  max_budget = budget_gen[1]
  areas_looking = areas_looking_gen
  User.create!(
    name:name, email: email, password: password, user_type: user_type, about: about, avatar: avatar,
    occupation: occupation, gender: gender, couple: couple, pets: pets, smoking: smoking, min_budget: min_budget,
    max_budget: max_budget, areas_looking: areas_looking, advertiser_type: advertiser_type, dob: dob,
  )
end

i = 1
postcodes = [
  '', 'SW18 9NB', 'SW6 1PW', 'SW7 5EZ', 'SW9 8UB', 'NW7 2QN', 'NW3 1EA', 'NE37 1SY', 'NE24 4GB',
  'L36 9TL', 'L3 6LB', 'N5 2AG', 'W3 0AA', 'NW3 2QZ', 'E2 8HT', 'SW6 2FE', 'W6 9RD', 'SW7 1DW', 'SE15 3PY', 'N20 9JR', 'E7 0DX'
]
20.times do
  owner_id = i
  title = Faker::Lorem.sentence(word_count: rand(2..10))
  blurb = Faker::Lorem.sentence(word_count: rand(10..40))
  address = Faker::Address.street_address
  town = @town_array.sample
  postcode = postcodes[i]
  price = (rand(700..1600)/25).ceil * 25
  deposit = rand((price / 2)..price)
  bills = ['Included', 'Included', 'Not Included'].sample
  furnished = ['Furnished', 'Furnished', 'Furnished', 'Furnished', 'Non-Furnished'].sample
  parking = ['Parking', 'No Parking'].sample
  occupant_count = rand(1..8)
  room_count = rand((occupant_count + 1)..(occupant_count + 5))
  outside_area = ['Garden', 'Terrace', 'Patio', 'Balcony', 'Other'].sample
  disabled_access = ['Disabled Access', 'No Disabled Access'].sample
  internet = ['Internet Included', 'No Internet Included'].sample
  min_age = age_range_gen[0]
  max_age = age_range_gen[1]
  smoking = ['Any', 'Smoking', 'Non-Smoking'].sample
  pets = pets_array_reducer(array_gen(pets_array))
  gender = array_gen(gender_array, occupant_count)
  occupations = array_gen(occupations_array, occupant_count)
  Property.create!(
    owner_id: owner_id, title: title, blurb: blurb, address: address, town: town, postcode: postcode,
    price: price, deposit: deposit, bills: bills, furnished: furnished, parking: parking, occupant_count: occupant_count,
    room_count: room_count, outside_area: outside_area, disabled_access: disabled_access, internet: internet, min_age: min_age,
    max_age: max_age, smoking: smoking, pets: pets, genders: gender, occupations: occupations
  )
  i += 1
end

test_postcodes = ['WC86 0IJ', 'NW70 6FM', 'WC87 9CI']

j = 0
3.times do
  owner_id = 2
  title = Faker::Lorem.sentence(word_count: rand(2..10))
  blurb = Faker::Lorem.sentence(word_count: rand(10..40))
  address = Faker::Address.street_address
  town = @town_array.sample
  postcode = test_postcodes[j]
  price = (rand(700..1600)/25).ceil * 25
  deposit = rand((price / 2)..price)
  bills = ['Included', 'Included', 'Not Included'].sample
  furnished = ['Furnished', 'Furnished', 'Furnished', 'Furnished', 'Non-Furnished'].sample
  parking = ['Parking', 'No Parking'].sample
  occupant_count = rand(1..8)
  room_count = rand((occupant_count + 1)..(occupant_count + 5))
  outside_area = ['Garden', 'Terrace', 'Patio', 'Balcony', 'Other'].sample
  disabled_access = ['Disabled Access', 'No Disabled Access'].sample
  internet = ['Internet Included', 'No Internet Included'].sample
  min_age = age_range_gen[0]
  max_age = age_range_gen[1]
  smoking = ['Any', 'Smoking', 'Non-Smoking'].sample
  pets = pets_array_reducer(array_gen(pets_array))
  gender = array_gen(gender_array, occupant_count)
  occupations = array_gen(occupations_array, occupant_count)
  Property.create!(
    owner_id: owner_id, title: title, blurb: blurb, address: address, town: town, postcode: postcode,
    price: price, deposit: deposit, bills: bills, furnished: furnished, parking: parking, occupant_count: occupant_count,
    room_count: room_count, outside_area: outside_area, disabled_access: disabled_access, internet: internet, min_age: min_age,
    max_age: max_age, smoking: smoking, pets: pets, genders: gender, occupations: occupations
  )
  j += 1
end

k = 1
29.times do
  h = 0
  number = rand(1..10)
  property_ids = (1..10).to_a.sort{ rand() - 0.5 }[1..number]
  property_ids.length.times do
    Shortlist.create!(user_id: k, property_id: property_ids[h])
    h += 1
  end
  k += 1
end