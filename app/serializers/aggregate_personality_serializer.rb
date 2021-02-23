class AggregatePersonalitySerializer < ActiveModel::Serializer
  attributes :id, :mbti_types, :interests, :skills, :religion, :politics, :exercise, :drinking, :education_level
end
