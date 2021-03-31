class IndividualPersonalitySerializer < ActiveModel::Serializer
  attributes :id, :mbti_type, :interests, :skills, :religion, :politics, :exercise, :drinking, :education_level
end
