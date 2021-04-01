FactoryBot.define do
  factory :flatmate_preference do
    couples { false }
    smoking { false }
    pets { false }
    occupations { 'MyString' }
    min_age { 1 }
    max_age { 1 }
    genders { 'MyString' }
  end
end
