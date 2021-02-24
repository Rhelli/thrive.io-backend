class User < ApplicationRecord
  has_secure_password

  has_one :individual_personality, dependent: :destroy
  has_one :house_preference, dependent: :destroy
  has_many :properties, foreign_key: :owner_id, dependent: :destroy

  VALID_NAME_REGEX = /\A[a-zA-Z ,.'-]+\z/
  validates :name, presence: true, length: {
    minimum: 1,
    maximum: 50,
    too_short: '%{count} is the minimum number of characters allowed.',
    too_long: '%{count} is the maximum number of characters allowed, please shorten your name!'
  }, format: { with: VALID_NAME_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {
    maximum: 255,
    too_long: '%{count} is the maximum number of characters allowed. Please ensure your email is valid.'
  }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {
    minimum: 7,
    maximum: 64,
    too_short: "%{count} is the minimum password length. Please increase it's length.",
    too_long: "%{count} is the maximum password length. Please reduce it's length."
  }
  validates :user_type, presence: true, inclusion: { in: %w[Looking Advertising] }
  validates :avatar, presence: true
  # validates :images
  validates :about, length: {
    maximum: 5000,
    too_long: "%{count} is the maximum character length for your 'About Me'. Try to keep it short but sweet!"
  }

  # NOT REQUIRED
  validates :occupation, inclusion: { in: %w[Student Professional Other] }
  validates :gender, inclusion: { in: %w[Male Female Transgender Other] }
  validates :couple, inclusion: { in: %w[Couple Non-Couple] }
  validates :pets, inclusion: { in: %w[Cats Dogs Fish Reptiles Birds Rodents Other None] }
  validates :smoking, inclusion: { in: %w[Smoking Non-Smoking Occassionally] }
  validates :min_budget, numericality: { only_integer: true, greater_than: 0 }
  validates :max_budget, numericality: { only_integer: true, greater_than: 0 }
  validates :areas_looking, length: {
    minimum: 1,
    maximum: 140,
    too_short: '%{count} is the minimum number of characters allowed.
                Please ensure you have listed the areas you are interested in correctly!',
    too_long: '%{count} is the maximum number of characters allowed.
              Please reduce the number of areas you have shortlisted!'
  }
end
