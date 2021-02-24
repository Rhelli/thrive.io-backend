class IndividualPersonality < ApplicationRecord
  validate :mbti_type, presence: true, inclusion: {
    in: %w[
      ISTJ ISTP ISFJ ISFP INFJ
      INFP INTJ INTP ESTP ESTJ
      ESFP ESFJ ENFP ENFJ ENTP ENTJ
    ]
  }

  validate :interests, presence: true, inclusion: {
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
  }

  validate :religion, presence: true, inclusion: {
    in: %w[Agnostic Athiest Buddhism Christianity Hinduism Islam Judaism Sikhism Other]
  }
  validate :politics, presence: true, inclusion: {
    in: %w[
      Anarchist Communist Socialist Social-Democrat Islamist
      Progressive Liberal Libertarian Replublican Republican
      Syncretic Democrat Populist Globalist Internationalist
      Environmentalist Green
    ]
  }
  validate :exercise, presence: true, inclusion: { in: %w[None Light Moderate Vigorous Extreme] }
  validate :drinking, presence: true, inclusion: { in: %w[None Occasionally Regularly] }
  validate :education_level, presence: true, inclusion: {
    in: ['Primary', 'High School', 'College', 'University', 'Postgraduate']
  }
end
