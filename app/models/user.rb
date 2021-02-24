class User < ApplicationRecord
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
  }, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: {
    minimum: 7,
    maximum: 64,
    too_short: "%{count} is the minimum password length. Please increase it's length.",
    too_long: "%{count} is the maximum password length. Please reduce it's length."
  }

  validates :user_type, presence: true
  validates :avatar, presence: true
  # validates :images
  validates :about, length: {
    maximum: 5000,
    too_long: "%{count} is the maximum character length for your 'About Me' information. Try to keep it short but sweet!"
  }
  validates :occupation, presence: true, length: {
    minimum: 1,
    maximum: 120,
    too_short: '%{count} is the minimum length of characters allowed. Please ensure your entered occupation is valid!',
    too_long: '%{count}, is the maximum length of characters allowed. Please abbreiviate or shorten your occupation title!'
  }
  validates :gender, presence: true
  validates :couple, presence: true
  validates :pets, presence: true
  validates :smoking, presence: true
  validates :min_budget, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_budget, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :areas_looking, presence: true, length: {
    minimum: 1,
    maximum: 140,
    too_short: '%{count} is the minimum number of characters allowed. Please ensure you have listed the areas you are interested in correctly!',
    too_long: '%{count} is the maximum number of characters allowed. Please reduce the number of areas you have shortlisted!'
  }
end
