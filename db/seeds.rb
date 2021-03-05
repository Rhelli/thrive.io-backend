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
    areas.push(Faker::Address.city)
  end
  areas
end

30.times do
  name = Faker::Name.first_name
  email = Faker::Internet.email
  password = 'password1'
  user_type = ['Looking', 'Advertising'].sample
  about = Faker::Lorem.sentence
  avatar = 'someimageurl.com'
  occupation = ['Professional', 'Student', 'Professional'].sample
  gender  = ['Male', 'Male', 'Female', 'Female', 'Female', 'Male', 'Transgender'].sample
  couple = ['Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Non-Couple', 'Couple'].sample
  pets = [
    'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Fish', 
    'Reptiles', 'Birds', 'Rodents', 'Other', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None'
  ].sample
  smoking = ['Smoking', 'Non-Smoking', 'Non-Smoking', 'Occassionally'].sample
  min_budget = budget_gen[0]
  max_budget = budget_gen[1]
  areas_looking = areas_looking_gen
  User.create!(
    name:name, email: email, password: password, user_type: user_type, about: about, avatar: avatar,
    occupation: occupation, gender: gender, couple: couple, pets: pets, smoking: smoking, min_budget: min_budget,
    max_budget: max_budget, areas_looking: areas_looking
  )
end

i = 1
postcodes = ['', 'SW18 9NB', 'SW6 1PW', 'SW7 5EZ', 'SW9 8UB', 'NW7 2QN', 'NW3 1EA', 'NE37 1SY', 'NE24 4GB', 'L36 9TL', 'L3 6LB']
10.times do
  owner_id = i;
  title = Faker::Lorem.sentence(word_count: rand(2..6))
  blurb = Faker::Lorem.sentence
  address = Faker::Address.street_address
  town = Faker::Address.city
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
  pets = [
    'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Cats', 'Dogs', 'Fish', 
    'Reptiles', 'Birds', 'Rodents', 'Other', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
    'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None'
  ].sample
  gender = ['Any', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female',
            'Male', 'Female', 'Male', 'Female', 'Transgender', 'Other'
  ].sample
  occupations = ['Professional', 'Any', 'Student'].sample
  Property.create!(
    owner_id: owner_id, title: title, blurb: blurb, address: address, town: town, postcode: postcode,
    price: price, deposit: deposit, bills: bills, furnished: furnished, parking: parking, occupant_count: occupant_count,
    room_count: room_count, outside_area: outside_area, disabled_access: disabled_access, internet: internet, min_age: min_age,
    max_age: max_age, smoking: smoking, pets: pets, genders: gender
  )
  i += 1
end

