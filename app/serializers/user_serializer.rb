class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob, :email, :user_type, :avatar, :about, :occupation, :gender, :couple, :pets, :smoking,
             :min_budget, :max_budget, :areas_looking, :advertiser_type, :shortlisted_properties, :properties
end
