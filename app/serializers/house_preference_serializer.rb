class HousePreferenceSerializer < ActiveModel::Serializer
  attributes :id, :smoking, :pets, :occupations, :min_age, :max_age, :genders
end
