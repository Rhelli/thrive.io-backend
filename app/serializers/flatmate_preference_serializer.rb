class FlatmatePreferenceSerializer < ActiveModel::Serializer
  attributes :id, :couples, :smoking, :pets, :occupations, :min_age, :max_age, :genders
end
