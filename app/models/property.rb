class Property < ApplicationRecord
  validates :title, presence: true, length: { 
    minimum: 1,
    maximum: 140,
    too_short: '%{count} is the minimum number of characters! Try to be more descriptive!',
    too_long: '%{count}, is the maximum number of characters! Try shortening your title!'
  }
  validates :user_type, presence: true, inclusion: { in: %w(looking advertising) }
  # Validate images - Check bookmarked article and sign up tpo cloudinary to host images
  validates :blurb, presence: true, length: { 
    minimum: 1,
    maximum: 3000,
    too_short: '%{count} is the minimum number of characters! Try to be more descriptive!',
    too_long: '%{count}, is the maximum number of characters! Try shortening your description!'
  }
  validates :address, presence: true, length: {
    minimum: 1,
    maximum: 1000
    too_short: '%{count} is the minimum number of characters! Please ensure you have entered your address fully.',
    too_long: '%{count}, is the maximum number of characters! Try shortening your description!'
  }


end
