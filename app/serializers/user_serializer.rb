class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob, :email, :user_type, :avatar, :about, :occupation, :gender, :couple, :pets, :smoking,
             :min_budget, :max_budget, :areas_looking, :advertiser_type
  
  has_many :properties
  has_many :shortlisted_properties
end
