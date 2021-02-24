class FlatmatePreference < ApplicationRecord
  validates :couples, presence: true, inclusion: { in: %w[Any Couples Non-Couples] }
  validates :smoking, presence: true, inclusion: { in: %w[Any Smoking Non-Smoking] }
  validates :pets, presence: true, inclusion: { in: %w[Any Cats Dogs Fish Reptiles Birds Rodents Other None] }
  validates :occupation, presence: true, inclusion: { in: %w[Any Student Professional] }
  validates :min_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :max_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :genders, presence: true, inclusion: { in: %w[Any Male Female Transgender Other] }
end
