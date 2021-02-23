FactoryBot.define do
  factory :aggregate_personality do
    mbti_types { "MyText" }
    interests { "MyText" }
    skills { "MyText" }
    religion { "MyText" }
    politics { "MyString" }
    exercise { "MyString" }
    drinking { "MyString" }
    education_level { "MyString" }
  end
end
