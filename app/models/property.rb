class Property < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id
  has_one :aggregate_personality, dependent: :destroy
  has_one :flatmate_preference, dependent: :destroy

  validates :title, presence: true, length: {
    minimum: 1,
    maximum: 140,
    too_short: '%{count} is the minimum number of characters! Try to be more descriptive!',
    too_long: '%{count}, is the maximum number of characters! Try shortening your title!'
  }
  # Validate images - Check bookmarked article and sign up to cloudinary to host images
  validates :blurb, presence: true, length: {
    minimum: 1,
    maximum: 3000,
    too_short: '%{count} is the minimum number of characters! Try to be more descriptive!',
    too_long: '%{count}, is the maximum number of characters! Try shortening your description!'
  }
  VALID_ADDRESS_REGEX = /\A[a-zA-Z \d,.'-]+\z/
  validates :address, length: {
    minimum: 8,
    maximum: 1000,
    wrong_length: 'The address you have entered is the wrong length. Please ensure you have entered a valid address.'
  }, format: { with: VALID_ADDRESS_REGEX }
  validates :town, presence: true, length: {
    in: 1..180,
    wrong_length: 'The address you have entered is either too short or too long. Please ensure you have entered it correctly.'
  }
  validates :postcode, presence: true, length: {
    minimum: 6,
    maximum: 8,
    too_short: '%{count} is the minimum number of characters in any UK postcode. Please ensure you have entered yours correctly.',
    too_long: '%{count} is the maximum number of characters in any UK postcode. Please ensure you have entered yours correctly.'
  }, format: { with: VALID_ADDRESS_REGEX }, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :deposit, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :bills, presence: true, inclusion: { in: ['Included', 'Not Included'] }
  validates :furnished, presence: true, inclusion: { in: %w[Furnished Non-Furnished] }
  validates :parking, presence: true, inclusion: { in: ['Parking', 'No Parking'] }
  validates :occupant_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :room_count, presence: true, numericality: { only_integer: true, greater_than: 1 }

  # NOT REQUIRED
  validates :outside_area, inclusion: { in: %w[Garden Terrace Patio Balcony Other] }, allow_nil: true
  validates :disabled_access, inclusion: { in: ['Disabled Access', 'No Disabled Access'] }, allow_nil: true
  validates :internet, inclusion: { in: ['Internet Included', 'No Internet Included'] }, allow_nil: true
  validates :min_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }, allow_nil: true
  validates :max_age, numericality: { only_integer: true, greater_than: 18, less_than: 125 }, allow_nil: true
  validates :smoking, inclusion: { in: %w[Any Smoking Non-Smoking] }, allow_nil: true
  validates :pets, inclusion: { in: %w[Any Cats Dogs Fish Reptiles Birds Rodents Other None] }, allow_nil: true
  validates :genders, inclusion: { in: %w[Any Male Female Transgender Other] }, allow_nil: true
  validates :occupations, inclusion: { in: %w[Any Student Professional] }, allow_nil: true
end
