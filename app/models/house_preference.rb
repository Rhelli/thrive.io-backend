class HousePreference < ApplicationRecord
  validates :smoking, presence: true, inclusion: { in: %w[Any Smoking Non-Smoking] }
  validates :pets, presence: true, inclusion: { in: %w[Any Cats Dogs Fish Reptiles Birds Rodents Other None] }
  validates :occupation, presence: true, inclusion: { in: %w[Any Student Professional] }
  validates :min_age, presence: true, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :max_age, presence: true, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :genders, presence: true, inclusion: { in: %w[Any Male Female Transgender Other] }
end
