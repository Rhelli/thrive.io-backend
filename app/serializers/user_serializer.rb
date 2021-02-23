class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :user_type, :images, :about, :occupation, :gender, :couple, :pets, :smoking, :min_budget, :max_budget, :areas_looking, :current_status, :min_stay, :max_stay
end
