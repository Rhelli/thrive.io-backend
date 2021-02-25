class AggregatePersonality < ApplicationRecord
  belongs_to :property
  belongs_to :individual_personality
end
