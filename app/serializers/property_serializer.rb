class PropertySerializer < ActiveModel::Serializer
  attributes :id, :title, :blurb, :address, :town, :postcode, :price, :deposit, :bills,
             :furnished, :parking, :outside_area, :disabled_access, :internet, :occupant_count, :room_count, :min_age,
             :max_age, :smoking, :pets, :genders, :occupations

end
