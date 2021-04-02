class ShortlistSerializer < ActiveModel::Serializer
  attributes :id, :user, :property

  belongs_to :property
  belongs_to :user
end
