class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :user_type
end
