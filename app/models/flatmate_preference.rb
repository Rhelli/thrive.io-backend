class FlatmatePreference < ApplicationRecord
  validates :couples, presence: true
  validates :smoking, presence: true
  validates :pets, presence: true
  validates :occupation, presence: true, inclusion: { in: %w[Any Student Professional] }
  validates :min_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :max_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }
  validates :genders, presence: true
end
