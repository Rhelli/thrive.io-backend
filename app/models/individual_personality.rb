class IndividualPersonality < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :aggregate_personality

  validate :mbti_type, inclusion: {
    in: %w[
      ISTJ ISTP ISFJ ISFP INFJ
      INFP INTJ INTP ESTP ESTJ
      ESFP ESFJ ENFP ENFJ ENTP ENTJ
    ]
  }, allow_nil: true

  validate :interests, inclusion: {
    in: [
      'Adventure', 'Animals', 'Beach',
      'Beer', 'Books', 'Camping',
      'Cats', 'Cycling', 'Coffee', 'Concerts',
      'Cooking', 'Dancing', 'Dogs',
      'Drinking', 'Eating Out', 'Family',
      'Fishing', 'Fitness', 'Food',
      'Football', 'God', 'Gym',
      'Hiking', 'Hunting', 'Jokes',
      'Laughing', 'Movies', 'Music',
      'Nerding Out', 'Netflix', 'Outdoors',
      'Pets', 'Pizza', 'Politics', 'Running',
      'Sports', 'Student', 'Tattoos', 'Travel',
      'Video Games', 'Walks', 'Wine',
      'Work', 'Writing'
    ]
  }, allow_nil: true

  validate :religion, inclusion: {
    in: %w[Agnostic Athiest Buddhism Christianity Hinduism Islam Judaism Sikhism Other]
  }, allow_nil: true
  validate :politics, inclusion: {
    in: %w[
      Anarchist Communist Socialist Social-Democrat Islamist
      Progressive Liberal Libertarian Replublican Republican
      Syncretic Democrat Populist Globalist Internationalist
      Environmentalist Green
    ]
  }, allow_nil: true
  validate :exercise, inclusion: { in: %w[None Light Moderate Vigorous Extreme] }, allow_nil: true
  validate :drinking, inclusion: { in: %w[None Occasionally Regularly] }, allow_nil: true
  validate :education_level, inclusion: {
    in: ['Primary', 'High School', 'College', 'University', 'Postgraduate']
  }, allow_nil: true
end
