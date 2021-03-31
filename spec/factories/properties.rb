FactoryBot.define do
  factory :property do
    title { 'MyString' }
    user_type { 'MyString' }
    images { 'MyText' }
    blurb { 'MyText' }
    type { '' }
    address { 'MyString' }
    postcode { 'MyString' }
    price { 1 }
    deposit { 1 }
    bills { false }
    furnished { false }
    parking { false }
    outside_area { false }
    disabled_access { false }
    internet { false }
    occupant_count { 1 }
    room_count { 1 }
    min_age { 1 }
    max_age { 1 }
    smoking { false }
    pets { false }
    genders { false }
    occupations { 'MyString' }
  end
end
