class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :user_type, :avatar, :about, :occupation, :gender, :couple, :pets, :smoking,
             :min_budget, :max_budget, :areas_looking
end
