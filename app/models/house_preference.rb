class HousePreference < ApplicationRecord
  validates :smoking, presence: true, inclusion: { in: %w[Any Smoking Non-Smoking] }

end
