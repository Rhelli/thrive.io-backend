FactoryBot.define do
  factory :individual_personality do
    mbti_type { 'MyString' }
    interests { 'MyText' }
    skills { 'MyText' }
    religion { 'MyString' }
    politics { 'MyString' }
    exercise { 'MyString' }
    drinking { 'MyString' }
    education_level { 'MyString' }
  end
end
