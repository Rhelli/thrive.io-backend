FactoryBot.define do
  factory :house_preference do
    smoking { false }
    pets { false }
    occupations { "MyString" }
    min_age { 1 }
    max_age { 1 }
    genders { "MyString" }
  end
end
