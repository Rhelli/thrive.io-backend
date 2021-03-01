class FlatmatePreference < ApplicationRecord
  belongs_to :property, foreign_key: :property_id

  validates :couples, inclusion: { in: %w[Any Couples Non-Couples] }, allow_nil: true
  validates :smoking, inclusion: { in: %w[Any Smoking Non-Smoking] }, allow_nil: true
  validates :pets, inclusion: { in: %w[Any Cats Dogs Fish Reptiles Birds Rodents Other None] }, allow_nil: true
  validates :occupation, inclusion: { in: %w[Any Student Professional] }, allow_nil: true
  validates :min_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }, allow_nil: true
  validates :max_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }, allow_nil: true
  validates :genders, inclusion: { in: %w[Any Male Female Transgender Other] }, allow_nil: true
end