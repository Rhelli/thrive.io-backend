class User < ApplicationRecord
  attr_accessor :password

  validates_confirmation_of :password
  before_save :encrypt_password

  has_one :individual_personality, foreign_key: :user_id, dependent: :destroy
  has_one :house_preference, foreign_key: :user_id, dependent: :destroy
  has_many :properties, foreign_key: :owner_id, dependent: :destroy

  VALID_NAME_REGEX = /\A[a-zA-Z \d,.'-]+\z/
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
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/
  validates :password, format: {
    with: VALID_PASSWORD_REGEX,
    message: 'Password must be a minimum of 8 characters, with numbers and letters present.'
  }
  validates :user_type, presence: true, inclusion: { in: %w[Looking Advertising] }
  # validates :images
  validates :about, length: {
    maximum: 5000,
    too_long: "%{count} is the maximum character length for your 'About Me'. Try to keep it short but sweet!"
  }

  # NOT REQUIRED
  validates :occupation, inclusion: { in: %w[Student Professional Other] }, allow_nil: true
  validates :gender, inclusion: { in: %w[Male Female Transgender Other] }, allow_nil: true
  validates :couple, inclusion: { in: %w[Couple Non-Couple] }, allow_nil: true
  validates :pets, inclusion: { in: %w[Cats Dogs Fish Reptiles Birds Rodents Other None] }, allow_nil: true
  validates :smoking, inclusion: { in: %w[Smoking Non-Smoking Occassionally] }, allow_nil: true
  validates :min_budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :max_budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :areas_looking, length: {
    maximum: 140,
    too_long: '%{count} is the maximum number of characters allowed.
              Please reduce the number of areas you have shortlisted!'
  }, allow_nil: true

  scope :looking_users, ->(user) { user.where('user_type = Looking').order(created_at: :desc) }
  scope :advertising_user, ->(user) { user.where('user_type = Advertising').order(created_at: :desc) }

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by 'email = ?', email
    return user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)

    nil
  end
end
