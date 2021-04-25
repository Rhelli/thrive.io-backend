class User < ApplicationRecord
  attr_accessor :password

  validates_confirmation_of :password
  before_save :encrypt_password

  has_many :properties, foreign_key: :owner_id, dependent: :destroy

  has_many :shortlists, foreign_key: :user_id, dependent: :destroy
  has_many :shortlisted_properties, through: :shortlists, source: :property

  VALID_NAME_REGEX = /\A[a-zA-Z ,.'-]+\z/
  validates :name, presence: true, length: {
    minimum: 1,
    maximum: 50,
    too_short: '%<count>s is the minimum number of characters allowed.',
    too_long: '%<count>s is the maximum number of characters allowed, please shorten your name!'
  }, format: { with: VALID_NAME_REGEX }
  validates :dob, presence: true
  validate :validate_age
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {
    maximum: 255,
    too_long: '%<count>s is the maximum number of characters allowed. Please ensure your email is valid.'
  }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/
  validates :password, format: {
    with: VALID_PASSWORD_REGEX,
    message: 'Password must be a minimum of 8 characters, with numbers and letters present.',
    if: :password
  }
  validates :user_type, presence: true, inclusion: { in: %w[Looking Advertising] }
  # validates :images
  validates :about, length: {
    maximum: 5000,
    too_long: "%<count>s is the maximum character length for your 'About Me'. Try to keep it short but sweet!"
  }

  # NOT REQUIRED
  validates :occupation, inclusion: { in: ['Student', 'Professional', 'Other', ''] }, allow_nil: true
  validates :gender, inclusion: { in: ['Male', 'Female', 'Transgender', 'Other', ''] }, allow_nil: true
  validates :couple, inclusion: { in: ['Couple', 'Non-Couple', ''] }, allow_nil: true
  validates :pets, inclusion: { in: %w[Cats Dogs Fish Reptiles Birds Rodents Other None] }, allow_nil: true
  validates :smoking, inclusion: { in: ['Smoking', 'Non-Smoking', 'Occassionally', ''] }, allow_nil: true
  validates :min_budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :max_budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :areas_looking, length: {
    maximum: 10,
    too_long: '%<count>s is the maximum number of characters allowed.
              Please reduce the number of areas you have shortlisted!'
  }, allow_nil: true
  validate :validates_area_format
  validates :advertiser_type, inclusion: { in: %w[Flatmate Landlord] }, allow_nil: true
  validate :validates_advertiser

  def validate_age
    errors.add(:dob, 'You must be over 18 to register for an account.') if dob.present? && dob > 18.years.ago
  end

  def validates_area_format
    return unless areas_looking.present? && areas_looking.any? { |area| !area.match(/\A[a-zA-Z \d,.'-]+\z/) }

    errors.add(:areas_looking, 'Please do not use any symbols or unusual characters.')
  end

  def validates_advertiser
    errors.add(:advertiser_type, 'You may not set your advertising type if you are looking for a property.') if
    advertiser_type.present? && user_type.present? && user_type == 'Looking'
  end

  scope :relevant_properties, lambda { |current_user|
                                Property.where('town IN (?)', current_user.areas_looking).order(created_at: :desc)
                              }
  scope :looking_users, -> { User.where('user_type = ?', 'Looking').order(created_at: :asc) }

  def encrypt_password
    return unless password.present? && !password.blank?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by 'email = ?', email
    return user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)

    nil
  end
end
